<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Qualification extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'qualification',
        'board_university',
        'year_of_passing',
        'percentage',
    ];

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
