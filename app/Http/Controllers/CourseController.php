<?php

namespace App\Http\Controllers;


use App\Models\Category;
use App\Models\Course;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::select('id', 'name')->get();
        return view('backend.admin.courses', compact('categories'));
    }

    public function datatables()
    {
        $courses = Course::select(
            'id',
            'name',
            'code',
            'category_id',
            'course_duration',
            'duration_time',
            'total_fee',
            'eligibility',
            'other_details',
            'course_type',
            'created_at'
        );

        return DataTables::of($courses)
            ->addColumn('action', function ($course) {
                return '<div class="btn-group btn-group-sm">
                    <button class="btn btn-success" onclick="getCourse(' . $course->id . ')">
                        <i class="fas fa-user-edit"></i>
                    </button>
                    <button  class="btn btn-danger" onclick="deleteCourse(' . $course->id . ')" id="row_' . $course->id . '">
                        <i class="far fa-trash-alt"></i> 
                    </button>
                </div>';
            })
            ->addColumn('course_duration', function ($course) {
                return $course->course_duration . ' ' . $course->duration_time;
            })
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'code' => 'required',
            'category_id' => 'required|integer|exists:categories,id',
        ]);
        $uppercaseCode = strtoupper($request->code);

        Course::create([
            'name' => $request->name,
            'code' => $uppercaseCode,
            'category_id' => $request->category_id,
            'course_duration' => $request->course_duration,
            'duration_time' => $request->duration_time,
            'total_fee' => $request->total_fee,
            'eligibility' => $request->eligibility,
            'other_details' => $request->other_details,
            'course_type' => $request->course_type,
        ]);

        return response()->json(['status' => true, 'message' => 'Course added successfully']);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = Course::find($id);
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Course $course)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Course $course)
    {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'code' => 'required',
            'category_id' => 'required|integer|exists:categories,id',
        ]);
        $uppercaseCode = strtoupper($request->code);

        $course->update([
            'name' => $request->name,
            'code' => $uppercaseCode,
            'category_id' => $request->category_id,
            'course_duration' => $request->course_duration,
            'duration_time' => $request->duration_time,
            'total_fee' => $request->total_fee,
            'eligibility' => $request->eligibility,
            'other_details' => $request->other_details,
            'course_type' => $request->course_type,
        ]);

        return response()->json(['status' => true, 'message' => 'Course added successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Course $course)
    {
        $course->delete();
        return response()->json(['status' => true, 'message' => 'State deleted successfully']);
    }
}
