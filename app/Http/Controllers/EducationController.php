<?php

namespace App\Http\Controllers;

use App\Models\Education;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class EducationController extends Controller
{

    public function index()
    {
        return view('backend.admin.education');
    }
    public function datatables()
    {
        $education = Education::select('id', 'name', 'created_at');
        return DataTables::of($education)
            ->addColumn('action', function ($education) {
                return '<div class="btn-group btn-group-sm">
                    <button class="btn btn-success" onclick="getEducation(' . $education->id . ')">
                        <i class="fas fa-user-edit"></i>
                    </button>
                    <button  class="btn btn-danger" onclick="deleteEducation(' . $education->id . ')" id="row_' . $education->id . '">
                        <i class="far fa-trash-alt"></i> 
                    </button>
                </div>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);

        $education = Education::create([
            'name' => $request->name,
        ]);

        return redirect()->route('educations.index')->with('success', 'Education added successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = Education::find($id);
        return $data;
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Education $education)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);
        // return $education;

        $education->update([
            'name' => $request->name,
        ]);

        return response()->json(['status' => true, 'message' => 'Education updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Education $education)
    {
        $education->delete();
        return response()->json(['status' => true, 'message' => 'Education deleted successfully']);
    }
}
