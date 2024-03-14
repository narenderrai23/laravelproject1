<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\EducationController;
use App\Http\Controllers\DistrictController;
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
    Route::view('/', 'backend.admin.dashboard')->name('admin.dashboard');
    Route::view('/profile', 'backend.admin.profile')->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('states', StateController::class);
    Route::get('state/datatables', [StateController::class, 'datatables'])->name('states.datatables');


    Route::resource('cities', CityController::class);
    Route::get('city/datatables', [CityController::class, 'datatables'])->name('cities.datatables');


    Route::resource('categories', CategoryController::class);
    Route::get('category/datatables', [CategoryController::class, 'datatables'])->name('categories.datatables');


    Route::resource('courses', CourseController::class);
    Route::get('course/datatables', [CourseController::class, 'datatables'])->name('courses.datatables');


    Route::resource('branches', BranchController::class);
    Route::get('branch/datatables', [BranchController::class, 'datatables'])->name('branches.datatables');
    Route::get('branches/generate-branch-code/{city_id}', [BranchController::class, 'generateBranchCode'])->name('fetch.cities');
    Route::get('branches/fetch-city/{city_id}', [BranchController::class, 'fetchCity']);


    Route::resource('educations', EducationController::class);
    Route::get('education/datatables', [EducationController::class, 'datatables'])->name('educations.datatables');


    Route::resource('districts', DistrictController::class);
    Route::get('district/datatables', [DistrictController::class, 'datatables'])->name('districts.datatables');



    Route::resource('students', StudentController::class);
    Route::get('student/datatables', [StudentController::class, 'datatables'])->name('students.datatables');
    Route::get('students/branch-code/{city_id}', [StudentController::class, 'branchCode'])->name('students.branch-code');
    Route::get('students/course-code/{city_id}', [CourseController::class, 'show'])->name('students.course-code');
    Route::get('students/fetch-city/{city_id}', [StudentController::class, 'fetchCity'])->name('students.city');
    Route::get('students/district/{city_id}', [DistrictController::class, 'fetchDistrict'])->name('students.district');

});

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

require __DIR__ . '/auth.php';
