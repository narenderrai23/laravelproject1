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
            $table->foreignId('branch_id')->constrained()->cascadeOnDelete();
            $table->string('enrollment')->unique();
            $table->foreignId('course_id')->constrained()->cascadeOnDelete();
            $table->date('till_date')->nullable();
            $table->string('name')->nullable();
            $table->string('father_name')->nullable();
            $table->string('father_occupation')->nullable();
            $table->date('student_dob');
            $table->enum('gender', ['male', 'female', 'other'])->nullable();
            $table->string('profile_image')->nullable();
            $table->string('address1')->nullable();
            $table->string('address2')->nullable();
            $table->foreignId('district_id')->constrained()->cascadeOnDelete();
            $table->string('phone')->nullable();
            $table->string('wphone')->nullable();
            $table->string('email')->unique();
            $table->string('pqualification')->nullable();
            $table->unsignedBigInteger('qualification')->nullable();
            $table->enum('student_status', ['running', 'complete', 'dropout'])->default('running');
            $table->string('created_by')->nullable();
            $table->enum('approve', ['no', 'yes'])->default('no');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
