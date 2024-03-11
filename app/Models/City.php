<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'code', 'state_id']; // Define the fillable fields

    public function state()
    {
        return $this->belongsTo(State::class); // Define the relationship with the State model
    }

    public function branch(){
        return $this->hasMany(State::class);
    }
}
