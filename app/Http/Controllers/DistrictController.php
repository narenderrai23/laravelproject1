<?php

namespace App\Http\Controllers;

use App\Models\State;
use App\Models\District;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;

class DistrictController extends Controller
{
    public function index()
    {
        $states = State::select('id', 'name')->get();
        return view('backend.admin.districts', compact('states'));
    }

    public function datatables()
    {
        $districts = DB::table('districts')
            ->select([
                'districts.id AS id',
                'districts.name AS name',
                'districts.created_at',
                'states.name AS sname',
            ])
            ->join('states', 'districts.state_id', '=', 'states.id')
            ->get();

        return DataTables::of($districts)
            ->addColumn('action', function ($District) {
                // Concatenate PHP variables directly into the HTML string
                return '<div class="btn-group btn-group-sm">
                    <button class="btn btn-success" onclick="getDistrict(' . $District->id . ')">
                        <i class="fas fa-user-edit"></i>
                    </button>
                    <button  class="btn btn-danger" onclick="deleteDistrict(' . $District->id . ')" id="row_' . $District->id . '">
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
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'state_id' => 'required|integer|exists:states,id',
        ]);

        District::create([
            'name' => $request->name,
            'state_id' => $request->state_id,
        ]);

        return response()->json(['status' => true, 'message' => 'District added successfully']);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = District::find($id);
        return $data;
    }

    public function fetchDistrict($state_id)
    {
        $districts = District::select(
            'id',
            'name'
        )
            ->where('state_id', $state_id)
            ->get();

        return response()->json($districts);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, District $District)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
        ]);
        // return $state;

        $District->update([
            'name' => $request->name,
            'state_id' => $request->state_id,
        ]);

        return response()->json(['status' => true, 'message' => 'District updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(District $District)
    {
        $District->delete();
        return response()->json(['status' => true, 'message' => 'District deleted successfully']);
    }
}
