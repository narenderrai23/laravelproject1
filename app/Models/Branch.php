<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    protected $fillable = [
        'city_id',
        'code',
        'name',
        'head',
        'category',
        'phone',
        'joining_date',
        'till_date',
        'address',
        'c_address',
        'email',
        'password',
    ];

   
    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'password' => 'hashed',
    ];

    public function cities()
    {
        return $this->belongsTo(City::class); // Define the relationship with the State model
    }

    public function student()
    {
        return $this->hasMany(Student::class);
    }
}
