<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->date('date_admission')->nullable();
            $table->unsignedBigInteger('branch_id');
            $table->string('enrollment')->nullable();
            $table->unsignedInteger('course_id');
            $table->date('till_date')->nullable();
            $table->string('name')->nullable();
            $table->string('father_name')->nullable();
            $table->string('father_occupation')->nullable();
            $table->date('student_dob');
            $table->enum('gender', ['male', 'female', 'other'])->nullable();
            $table->string('profile_image');
            $table->string('address1')->nullable();
            $table->string('address2')->nullable();
            $table->string('district_id')->nullable();
            $table->string('phone')->nullable();
            $table->string('wphone')->nullable();
            $table->string('email')->nullable();
            $table->string('pqualification')->nullable();
            $table->unsignedBigInteger('qualification')->nullable();
            $table->enum('student_status', ['running', 'complete', 'dropout'])->nullable();
            $table->string('created_by')->nullable();
            $table->enum('approve', ['no', 'yes']);
            $table->timestamps();
        });

        // Foreign key constraint for branch_id
        // Schema::table('students', function (Blueprint $table) {
        //     $table->foreign('branch_id')->references('id')->on('branches');
        // });

        // Schema::table('students', function (Blueprint $table) {
        //     $table->foreign('course_id')->references('id')->on('courses');
        // });

        // // Foreign key constraint for state_id
        // Schema::table('students', function (Blueprint $table) {
        //     $table->foreign('district_id')->references('id')->on('districts');
        // });

        // Foreign key constraint for qualification
        // Schema::table('students', function (Blueprint $table) {
        //     $table->foreign('qualification')->references('id')->on('qualifications');
        // });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
