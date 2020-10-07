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
            Route::get('view/{id}', 'NewsController@view')->name('news.view');
            Route::get('notification', 'NewsController@notification')->name('news.notification');
        });

        Route::prefix('new-words')->group(function () {
            Route::get('/{level}/{category?}/{sub_category?}', 'NewWordsController@index')->name('new.words.index')->where('level', 'beginner|intermediate|advanced');
        });

        Route::prefix('new-phrases')->group(function () {
            Route::get('/{level}/{category?}/{sub_category?}', 'NewPhrasesController@index')->name('new.phrases.index')->where('level', 'beginner|intermediate|advanced');
        });

        Route::prefix('new-verbs')->group(function () {
            Route::get('/{level}/{category?}/{sub_category?}', 'NewVerbsController@index')->name('new.verbs.index')->where('level', 'beginner|intermediate|advanced');
        });

        Route::prefix('new-words-collection')->group(function () {
            Route::get('/{category?}/{sub_category?}', 'NewWordsController@collection')->name('new.words.collection');
        });

        Route::prefix('new-phrases-collection')->group(function () {
            Route::get('/{category?}/{sub_category?}', 'NewWordsController@collection')->name('new.words.collection');
        });

        Route::prefix('new-verbs-collection')->group(function () {
            Route::get('/{category?}/{sub_category?}', 'NewWordsController@collection')->name('new.words.collection');
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
