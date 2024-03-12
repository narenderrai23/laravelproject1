<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'date_admission',
        'branch_id',
        'enrollment',
        'course_id',
        'course',
        'name',
        'father_name',
        'father_occupation',
        'student_dob',
        'gender_id',
        'phone',
        'profile_image',
        'address1',
        'address2',
        'country_id',
        'state_id',
        'city_id',
        'course_status_id',
        'education_id',
        'email',
        'student_whatsapp_phone',
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class);
    }
  

    public function education()
    {
        return $this->belongsTo(Education::class);
    }


    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }
  
}
