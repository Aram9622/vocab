<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//Artisan commands
Route::get('/storage-link', function () {
    \Illuminate\Support\Facades\Artisan::call('storage:link');

    return 'Storage Link Created';
});

//Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');
