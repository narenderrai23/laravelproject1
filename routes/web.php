<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\CityController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::view('/dashboard', 'dashboard')->name('dashboard')->middleware('admin');

Route::group(['middleware' => 'admin', 'prefix' => 'admin'], function () {
    Route::view('/dashboard', 'backend.admin.dashboard')->name('admin.dashboard');
    Route::view('/profile', 'backend.admin.profile')->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('states', StateController::class);
    Route::resource('cities', CityController::class);
    Route::post('/ajax', [CityController::class, 'addAjax'])->name('addAjax');
    Route::get('state/datatables', [StateController::class, 'datatables'])->name('states.datatables');
    Route::get('city/datatables', [CityController::class, 'datatables'])->name('cities.datatables');
});

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

require __DIR__ . '/auth.php';
