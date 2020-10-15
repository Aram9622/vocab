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

        Route::prefix('studied')->group(function () {
            Route::post('/', 'StudiedController@get')->name('studied.index');
            Route::post('/view/{id}', 'StudiedController@view')->name('studied.view');
            Route::post('/store', 'StudiedController@store')->name('studied.store');
        });

        Route::prefix('flashcard')->group(function () {
            Route::prefix('group')->group(function () {
                Route::get('/', 'FlashcardController@groups')->name('flashcard.group.index');
                Route::get('/view/{id}', 'FlashcardController@groupView')->name('flashcard.group.view');
                Route::post('/create', 'FlashcardController@groupStore')->name('flashcard.group.create');
                Route::post('/update/{id}', 'FlashcardController@groupStore')->name('flashcard.group.update');
                Route::delete('/delete/{id}', 'FlashcardController@groupDelete')->name('flashcard.group.delete');
            });
        });

        Route::get('new-words/{level}/{category?}/{sub_category?}', 'NewWordsController@index')->name('new.words.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('new-phrases/{level}/{category?}/{sub_category?}', 'NewPhrasesController@index')->name('new.phrases.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('new-verbs/{level}/{category?}/{sub_category?}', 'NewVerbsController@index')->name('new.verbs.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('exercises/{level}/{category?}/{sub_category?}', 'ExercisesController@index')->name('new.exercises.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('conversations/{level}/{category?}/{sub_category?}', 'ConversationsController@index')->name('new.conversations.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('stories/{level}/{category?}/{sub_category?}', 'StoriesController@index')->name('new.stories.index')->where('level', 'beginner|intermediate|advanced');

        //////////////////
        Route::post('general', 'SiteController@general');
        Route::post('new-words-show/{id}', 'SiteController@categoryItem');
        //////////////////

        Route::get('new-words-collection/{category?}/{sub_category?}', 'NewWordsController@collection')->name('new.words.collection');
        Route::get('new-phrases-collection/{category?}/{sub_category?}', 'NewPhrasesController@collection')->name('new.phrases.collection');
        Route::get('new-verbs-collection/{category?}/{sub_category?}', 'NewVerbsController@collection')->name('new.verbs.collection');
        Route::get('exercises-collection/{category?}/{sub_category?}', 'ExercisesController@collection')->name('new.exercises.collection');
        Route::get('conversations-collection/{category?}/{sub_category?}', 'ConversationsController@collection')->name('new.conversations.collection');
        Route::get('stories-collection/{category?}/{sub_category?}', 'StoriesController@collection')->name('new.stories.collection');

        //////////////////

        Route::get('items-state/{type}/{current_state}', 'NewWordsController@state');
        Route::get('items-state-collection', 'NewWordsController@stateCollection');
        Route::post('item-state-change/{type}/{id}', 'NewWordsController@stateChange');
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
