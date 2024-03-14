<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'code',
        'category_id',
        'course_duration',
        'duration_time',
        'total_fee',
        'eligibility',
        'other_details',
        'course_type',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
