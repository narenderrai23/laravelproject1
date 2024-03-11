<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\City;
use App\Models\State;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class BranchController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $states = State::select('id', 'name')->get();
        return view('backend.admin.branches', compact('states'));
    }

    public function datatables()
    {
        $courses = Branch::select(
            'id',
            'name',
            'code',
            'head',
            'category',
            'created_at',
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

    public function generateBranchCode($city_id)
    {
        // Fetch the city name based on the city_id
        $city = City::findOrFail($city_id);
        $cityCode = $city->code;
        $lastBranchId = sprintf('%03d', Branch::max('id') + 1);
        $branchCode = $cityCode . now()->format('Ymd') . ($lastBranchId);
        return response()->json($branchCode);
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
            'city_id' => 'required|integer|exists:cities,id',
            'code' => 'required|string|unique:branches,code|max:20',
            'name' => 'required|string|max:100',
            'head' => 'required|string|max:100',
            'category' => 'required|in:authorized,training,learning',
            'phone' => 'required|string|max:20',
            'joining_date' => 'required|date',
            'address' => 'required|string',
            'c_address' => 'required|string',
            'email' => 'required|email|unique:branches|max:100',
            'password' => 'required|string|max:255',
        ]);


        $joining_date = $request->joining_date;
        $till_date = date('Y-m-d', strtotime($joining_date . ' +3 years'));

        Branch::create([
            'city_id' => $request->city_id,
            'code' => $request->code,
            'name' => $request->name,
            'head' => $request->head,
            'category' => $request->category,
            'phone' => $request->phone,
            'joining_date' => $request->joining_date,
            'till_date' => $till_date,
            'address' => $request->address,
            'c_address' => $request->c_address,
            'email' => $request->email,
            'password' => $request->password,
        ]);

        return response()->json(['status' => true, 'message' => 'Course added successfully']);
    }


    public function show($id)
    {
        $cities = City::where('state_id', $id)->select('id', 'name')->get();
        return response()->json($cities);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Branch $branch)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Branch $branch)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Branch $branch)
    {
        //
    }
}
