<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Course;
use App\Models\City;
use App\Models\Education;
use App\Models\State;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $states = State::select('id', 'name')->get();
        $branches = Branch::select('id', 'name')->get();
        $course = Course::select('id', 'code')->get();
        $level = Education::select('id', 'name')->get();
        return view('backend.admin.students.add', compact('states', 'level', 'branches', 'course'));
    }


    public function branchCode($id)
    {
        $branch = Branch::select('code')
            ->where('id', $id)
            ->first();
        return response()->json($branch);
    }


    public function courseDetails($id)
    {
        $course = Course::select(
            'name',
            'course_duration',
            'duration_time',
            'total_fee',
            'eligibility',
            'course_type',
        )
            ->where('id', $id)
            ->first();
        return response()->json($course);

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
        //
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
    public function edit(Student $student)
    {
        //
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
    public function destroy(Student $student)
    {
        //
    }
}
