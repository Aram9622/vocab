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

    Route::namespace('Api\v1')->group(function () {
        Route::post('change/password', 'UserController@changePassword');
        Route::get('user', 'UserController@show');
        Route::post('user/update-avatar', 'UserController@updateAvatar');
        Route::post('user/update', 'UserController@update');

        Route::prefix('news')->group(function () {
            Route::get('/', 'NewsController@index')->name('news.index');
            Route::get('view', 'NewsController@view')->name('news.view');
        });
    });

});

Route::get('logout', 'Api\v1\Auth\LoginController@logout');

//Authentication routes
Route::group(['namespace' => 'Api\v1\Auth'], function () {
    Route::post('register', 'RegisterController@register');
    Route::post('login', 'LoginController@login');
    Route::post('password/email', 'ForgotPasswordController@sendResetLinkEmail');

    Route::post('password-reset-request', 'PasswordResetController@create');
    Route::get('find/{token}', 'PasswordResetController@find');
    Route::post('password-reset', 'PasswordResetController@reset');
});
