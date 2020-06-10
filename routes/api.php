<?php

use Illuminate\Http\Request;
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

Route::middleware(['auth:api', 'verify_register'])->group(function () {
//    Route::get('user', 'Api\v1\UserController@show');
});


//Authentication routes
Route::group(['namespace' => 'Api\v1\Auth'], function () {
    Route::post('register', 'RegisterController@register');
    Route::post('login', 'LoginController@login');
    Route::get('logout', 'LoginController@logout')->middleware('auth:api');
//    Route::get('email/resend', 'VerificationController@resend')->name('verification.resend');
//    Route::get('email/verify/{id}/{hash}', 'VerificationController@verify')->name('verification.verify');
//    Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');
//    Route::post('password/reset', 'ResetPasswordController@reset');
});
