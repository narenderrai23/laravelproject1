<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\City;
use App\Models\Course;
use App\Models\Qualification;
use App\Models\Education;
use App\Models\State;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\Demomail;
use Illuminate\Support\Facades\Auth;


class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('backend.admin.students.index');
    }

    public function datatables()
    {
        $students = DB::table('students')
            ->select([
                'students.id',
                'students.enrollment',
                'students.name',
                'students.father_name',
                'students.email',
                'students.approve',
                'students.date_admission',
                'students.student_status',
                'branches.name AS branch_name',
                'courses.code AS course_code',
            ])
            ->join('branches', 'students.branch_id', '=', 'branches.id')
            ->join('courses', 'students.course_id', '=', 'courses.id')
            ->get();

        return DataTables::of($students)
            ->addColumn('action', function ($state) {
                return '<div class="btn-group btn-group-sm">
                <a class="btn btn-success" href="students/' . $state->id . '/edit">
                  <i class="font-size-10 fas fa-user-edit"></i>
                </a>
                <button  class="btn btn-danger" onclick="deleteState(' . $state->id . ')" id="row_' . $state->id . '">
                    <i class="far fa-trash-alt"></i> 
                </button>
                <a class="btn btn-info" href="details-student.php?id=' . $state->id . '">
                  <i class="font-size-10 fas fa-eye"></i>
                </a>
                <button class="btn btn-primary cartificate" onclick="edit(' . $state->enrollment . ')">
                  <i class="font-size-10 fas fa-certificate
                  "></i>
                </button>
              </div>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }


    public function branchCode($id)
    {
        $branch = Branch::select('code')->find($id);
        return response()->json($branch);
    }

    public function approve($id)
    {
        $post = Student::find($id);

        // Check if the student post exists
        if (!$post) {
            return response()->json(['status' => false, 'message' => 'Student not found']);
        }

        // Check if already approved
        if ($post->approve === 'yes') {
            return response()->json(['status' => false, 'message' => 'Already approved']);
        }

        $branch = Branch::find($post->branch_id);
        if (!isset ($branch->city_id)) {
            return ['status' => false, 'message' => 'Select Correct Branch.'];
        }

        $cities = City::select('code, name')->where('id', $branch->city_id)->first();
        if (!isset ($cities->code)) {
            return ['status' => false, 'message' => 'Select Correct City'];
        }

        $enrollment = $this->generateEnrollmentNumber($cities->code, $post->date_admission, $id);

        $table = 'students';
        $status = 'yes';
        try {
            $mail = Student::where('id', $id)
                ->update([
                    'approve' => $status,
                    'enrollment' => $enrollment,
                ]);

            if ($mail) {
                $mailData = [
                    'title' => 'Your Admission is Confirmed!',
                    'post' => $post,
                    'branch' => $branch,
                    'cities' => $cities,
                ];
                Mail::to('narenderrai23@gmail.com')->send(new Demomail($mailData));
            }
            return response()->json(['status' => true, 'message' => 'Status updated!', 'enrollment' => $enrollment]);
        } catch (\Exception $e) {
            return ['status' => false, 'message' => 'Database error: ' . $e->getMessage()];
        }
    }

    public function StudentStatus(Request $request, Student $student)
    {
        try {
            Student::where('id', $request->id)
                ->update([
                    'student_status' => $request->status,
                ]);
            return response()->json(['status' => true, 'message' => 'State updated successfully']);
        } catch (\Exception $e) {
            return ['status' => false, 'message' => 'Database error: ' . $e->getMessage()];
        }
    }


    function generateEnrollmentNumber($code, $date_admission, $id)
    {
        $date_admission = $date_admission = date("Ymd");
        $id = str_pad($id, 4, '0', STR_PAD_LEFT);
        $enrollment = $code . str_replace('-', '', $date_admission) . str_pad($id, 4, '0', STR_PAD_LEFT);
        return $enrollment;
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $states = State::select('id', 'name')->get();
        $branches = Branch::select('id', 'name')->get();
        $course = Course::select('id', 'code')->get();
        $level = Education::select('id', 'name')->get();
        return view('backend.admin.students.add', compact('states', 'level', 'branches', 'course'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required|string|max:255',
            'course_name' => 'required|string|max:255',
            'branch_id' => 'required|integer',
            'student_dob' => 'required|date',
            'phone' => 'required|string|max:20',
            'district_id' => 'required|integer',
            'wphone' => 'nullable|string|max:20',
            'date_admission' => 'required|date',
            'father_name' => 'nullable|string|max:255',
            'gender' => 'required|in:male,female,other',
            'address1' => 'required|string|max:255',
            'email' => 'required|string|email|unique:students,email|max:255',

        ];

        $validator = Validator::make($request->all(), $rules);

        // Check if validation fails
        if ($validator->fails()) {
            return ['status' => false, 'message' => $validator->errors()->first(), 'request' => $request->all()];
        }


        $created_by = Auth::user()->email;
        $student_status = 'running';


        $branch = Branch::where('id', $request->branch_id)->first();
        if (!$branch || !isset ($branch->city_id)) {
            return ['status' => false, 'message' => "Please fill in all required fields. The field 'Branch' is required."];
        }

        $city_id = $branch->city_id;
        $cityCode = City::select('cities.code')->where('id', $city_id)->first();
        $code = $cityCode->code;

        $lastId = Student::latest()->pluck('id')->first();
        $enrollment = 'New-' . $code . str_pad($lastId + 1, 4, '0', STR_PAD_LEFT);
        if (!$enrollment) {
            return ['status' => false, 'message' => "Please fill in all required fields. Error in Enrollment"];
        }
        $course = Course::find($request->course_id);
        $till_date = date('Y-m-d', strtotime($request->date_admission . ' +' . $course->course_duration . ' ' . $course->duration_time));

        $studentData = [
            'date_admission' => $request->date_admission,
            'course_id' => $request->course_id,
            'branch_id' => $request->branch_id,
            'enrollment' => $enrollment,
            'name' => $request->name,
            'father_name' => $request->father_name,
            'father_occupation' => $request->father_occupation,
            'student_dob' => $request->student_dob,
            'gender' => $request->gender,
            'address1' => $request->address1,
            'address2' => $request->address2,
            'district_id' => $request->district_id,
            'phone' => $request->phone,
            'wphone' => $request->wphone,
            'email' => $request->email,
            'qualification' => $request->qualification,
            'pqualification' => $request->pqualification,
            'student_status' => $student_status,
            'created_by' => $created_by,
            'till_date' => $till_date,
            'profile_image' => $request->profile_image,
        ];

        $student = Student::create($studentData);

        // Check if the student record was successfully created
        if ($student) {
            // Create a new Qualification record
            $qualification = Qualification::create([
                'student_id' => $student->id,
                'qualification' => $request->qualification,
                'board_university' => $request->board_university,
                'year_of_passing' => $request->year_of_passing,
                'percentage' => $request->percentage
            ]);

            if ($qualification) {
                return response()->json(['status' => true, 'message' => 'Student and Qualification added successfully']);
            } else {
                // Handle error if Qualification record creation fails
                return response()->json(['status' => false, 'message' => 'Failed to add Qualification']);
            }
        } else {
            // Handle error if Student record creation fails
            return response()->json(['status' => false, 'message' => 'Failed to add Student']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $data = Student::find($id);
        $states = State::select('id', 'name')->get();
        $branches = Branch::select('id', 'name')->get();
        $course = Course::select('id', 'code')->get();
        $level = Education::select('id', 'name')->get();
        return view('backend.admin.students.edit', compact('data', 'states', 'level', 'branches', 'course'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Student $student)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */

    // public function destroy(Student $student)
    // {
    //     $student->delete();
    //     return response()->json(['status' => true, 'message' => 'Student deleted successfully']);
    // }

    public function destroy($id)
    {
        Student::where('id', $id)->delete();
        return response()->json(['status' => true, 'message' => 'Student deleted successfully']);
    }
}
