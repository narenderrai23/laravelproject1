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
        Schema::create('branches', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('city_id');
            $table->foreign('city_id')->references('id')->on('cities');
            $table->string('code', 20)->unique();
            $table->string('name', 100);
            $table->string('head', 100);
            $table->enum('category', ['authorized', 'training', 'learning']);
            $table->string('phone', 20);
            $table->date('joining_date',);
            $table->date('till_date');
            $table->text('address');
            $table->text('c_address');
            $table->string('email', 100)->unique();
            $table->string('password', 255);
            $table->integer('reset_otp')->nullable();
            $table->timestamp('reset_otp_timestamp')->useCurrent();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('branches');
    }
};
