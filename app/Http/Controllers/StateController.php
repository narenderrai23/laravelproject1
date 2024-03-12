<?php

namespace App\Http\Controllers;

use App\Models\State;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class StateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('backend.admin.states');
    }
    public function datatables()
    {
        $states = State::select('id', 'name', 'created_at');
        return DataTables::of($states)
            ->addColumn('action', function ($state) {
                return '<div class="btn-group btn-group-sm">
                    <button class="btn btn-success" onclick="getState(' . $state->id . ')">
                        <i class="fas fa-user-edit"></i>
                    </button>
                    <button  class="btn btn-danger" onclick="deleteState(' . $state->id . ')" id="row_' . $state->id . '">
                        <i class="far fa-trash-alt"></i> 
                    </button>
                </div>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('states.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);

        $state = State::create([
            'name' => $request->name,
        ]);

        return redirect()->route('states.index')->with('success', 'State added successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = State::find($id);
        return $data;
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(State $state)
    {
        // return view('states.edit', compact('state'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, State $state)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);
        // return $state;

        $state->update([
            'name' => $request->name,
        ]);

        return response()->json(['status' => true, 'message' => 'State updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(State $state)
    {
        $state->delete();
        return response()->json(['status' => true, 'message' => 'State deleted successfully']);
    }
}
