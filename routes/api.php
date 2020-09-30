<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:api'])->group(function () {
    Route::get('user', 'Api\v1\UserController@show');
    Route::patch('user/update', 'Api\v1\UserController@update');
});

Route::get('logout', 'Api\v1\Auth\LoginController@logout');

//Authentication routes
Route::group(['namespace' => 'Api\v1\Auth'], function () {
    Route::post('register', 'RegisterController@register');
    Route::post('login', 'LoginController@login');
    Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');
});
