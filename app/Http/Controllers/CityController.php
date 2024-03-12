<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\State;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;


class CityController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $states = State::select('id', 'name')->get();
        return view('backend.admin.cities', compact('states'));
    }

    public function datatables()
    {
        $cities = DB::table('cities')
            ->select([
                'cities.id AS id',
                'cities.name AS name',
                'cities.code',
                'cities.created_at',
                'states.name AS sname',
            ])
            ->join('states', 'cities.state_id', '=', 'states.id')
            ->get();

        return DataTables::of($cities)
            ->addColumn('action', function ($city) {
                // Concatenate PHP variables directly into the HTML string
                return '<div class="btn-group btn-group-sm">
                    <button class="btn btn-success" onclick="getcity(' . $city->id . ')">
                        <i class="fas fa-user-edit"></i>
                    </button>
                    <button  class="btn btn-danger" onclick="deletecity(' . $city->id . ')" id="row_' . $city->id . '">
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
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'code' => 'required|max:3',
            'state_id' => 'required|integer|exists:states,id',
        ]);
        $uppercaseCode = strtoupper($request->code);

        City::create([
            'name' => $request->name,
            'code' => $uppercaseCode,
            'state_id' => $request->state_id,
        ]);

        return response()->json(['status' => true, 'message' => 'City added successfully']);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $data = City::find($id);
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(City $city)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, City $city)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'code' => ['required', 'string', 'max:255'],
        ]);
        // return $state;
        $uppercaseCode = strtoupper($request->code);

        $city->update([
            'name' => $request->name,
            'code' => $uppercaseCode,
            'state_id' => $request->state_id,
        ]);

        return response()->json(['status' => true, 'message' => 'State updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(City $city)
    {
        $city->delete();
        return response()->json(['status' => true, 'message' => 'State deleted successfully']);
    }
}
