<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function cities()
    {
        return $this->hasMany(City::class); // Define the relationship with the City model
    }

    public function districts()
    {
        return $this->hasMany(District::class); // Define the relationship with the City model
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
