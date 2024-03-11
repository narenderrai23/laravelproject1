<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('category_id'); // Define the category_id column
            $table->foreign('category_id')->references('id')->on('categories'); 
            $table->string('code');
            $table->integer('course_duration');
            $table->enum('duration_time', ['Days', 'Months', 'Year']);
            $table->decimal('total_fee', 10, 2)->nullable();
            $table->string('eligibility')->nullable();
            $table->text('other_details')->nullable();
            $table->enum('course_type', ['Career Programs', 'Professional Course', 'Short-Term Programs']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
