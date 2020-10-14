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

//Password reset
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.update');

//Artisan commands
Route::get('/storage-link', function () {
    \Illuminate\Support\Facades\Artisan::call('storage:link');

    return 'Storage Link Created';
});

///////////////////////// ADMIN PANEL /////////////////////////

Route::group(['as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth']], function () {
    Route::get('/', function () {
        return redirect()->route('admin.new.words.index', 'beginner');
    });

    Route::get('/delete-category/{category}', function (\App\Models\Category $category) {
        $category->delete();
        return back();
    })->name('category.delete');

    Route::prefix('new-words')->group(function () {
        Route::get('/{level}/{category?}/{sub_category?}', 'NewWordsController@index')->name('new.words.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('{level}/{category}/{sub_category}/add-word', 'NewWordsController@addItem')->name('new.words.add.item');

        Route::get('edit/{word}', 'NewWordsController@edit')->name('new.words.edit.item');
        Route::post('update-item/{word}', 'NewWordsController@updateItem')->name('new.words.update.item');

        Route::post('/{level}/{parent?}', 'NewWordsController@createCategory')->name('new.words.create.category')->where('level', 'beginner|intermediate|advanced');
        Route::post('store-item/{category_id}', 'NewWordsController@storeItem')->name('new.words.store.item');
        Route::get('delete-item/{word}', 'NewWordsController@deleteItem')->name('new.words.delete.item');

        Route::post('item-visibility', 'NewWordsController@visibility')->name('new.words.visibility.item');
    });

    Route::prefix('new-phrases')->group(function () {
        Route::get('/{level}/{category?}/{sub_category?}', 'NewPhrasesController@index')->name('new.phrases.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('{level}/{category}/{sub_category}/add-phrase', 'NewPhrasesController@addItem')->name('new.phrases.add.item');

        Route::get('edit/{phrase}', 'NewPhrasesController@edit')->name('new.phrases.edit.item');
        Route::post('update-item/{phrase}', 'NewPhrasesController@updateItem')->name('new.phrases.update.item');

        Route::post('/{level}/{parent?}', 'NewPhrasesController@createCategory')->name('new.phrases.create.category')->where('level', 'beginner|intermediate|advanced');
        Route::post('store-item/{category_id}', 'NewPhrasesController@storeItem')->name('new.phrases.store.item');
        Route::get('delete-item/{phrase}', 'NewPhrasesController@deleteItem')->name('new.phrases.delete.item');

        Route::post('item-visibility', 'NewPhrasesController@visibility')->name('new.phrases.visibility.item');
    });

    Route::prefix('new-verbs')->group(function () {
        Route::get('/{level}/{category?}/{sub_category?}', 'NewVerbsController@index')->name('new.verbs.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('{level}/{category}/{sub_category}/add-verb', 'NewVerbsController@addItem')->name('new.verbs.add.item');

        Route::get('edit/{verb}', 'NewVerbsController@edit')->name('new.verbs.edit.item');
        Route::post('update-item/{verb}', 'NewVerbsController@updateItem')->name('new.verbs.update.item');

        Route::post('/{level}/{parent?}', 'NewVerbsController@createCategory')->name('new.verbs.create.category')->where('level', 'beginner|intermediate|advanced');
        Route::post('store-item/{category_id}', 'NewVerbsController@storeItem')->name('new.verbs.store.item');
        Route::get('delete-item/{verb}', 'NewVerbsController@deleteItem')->name('new.verbs.delete.item');

        Route::post('item-visibility', 'NewVerbsController@visibility')->name('new.verbs.visibility.item');
    });

    Route::prefix('exercises')->group(function () {
        Route::get('/{level}/{category?}/{sub_category?}', 'ExercisesController@index')->name('new.exercises.index')->where('level', 'beginner|intermediate|advanced');
        Route::get('/{level}/{category}/{sub_category}/add-exercise', 'ExercisesController@addItem')->name('new.exercises.add.item');

        Route::post('/{level}/{parent?}', 'ExercisesController@createCategory')->name('new.exercises.create.category')->where('level', 'beginner|intermediate|advanced');
        Route::post('store-item/{category_id}', 'ExercisesController@storeItem')->name('new.exercises.store.item');
        Route::get('delete-item/{exercise}', 'ExercisesController@deleteItem')->name('new.exercises.delete.item');

        Route::prefix('my/exercise/actions')->group(function() {
            Route::post('update-item/{exercise}', 'ExercisesController@updateItem')->name('new.exercises.update.item');
            Route::get('edit/{exercise}', 'ExercisesController@edit')->name('new.exercises.edit.item');
            Route::post('item-visibility', 'ExercisesController@visibility')->name('new.exercises.visibility.item');
        });
    });

    Route::prefix('reading-and-listening')->group(function () {
        Route::prefix('conversations')->group(function () {
            Route::get('edit/{conversation}', 'ConversationsController@edit')->name('new.conversations.edit.item');

            Route::get('/{level}/{category?}/{sub_category?}', 'ConversationsController@index')->name('new.conversations.index');

            Route::get('{level}/{category}/{sub_category}/add-conversation', 'ConversationsController@addItem')->name('new.conversations.add.item');


            Route::post('update-item/{conversation}', 'ConversationsController@updateItem')->name('new.conversations.update.item');

            Route::post('/{level}/{parent?}', 'ConversationsController@createCategory')->name('new.conversations.create.category')->where('level', 'beginner|intermediate|advanced');

            Route::post('store-item/{category_id}', 'ConversationsController@storeItem')->name('new.conversations.store.item');
            Route::post('delete-item/{conversation}', 'ConversationsController@deleteItem')->name('new.conversations.delete.item');

            Route::post('item-visibility', 'ConversationsController@visibility')->name('new.conversations.visibility.item');
        });

        Route::prefix('stories')->group(function () {
            Route::get('edit/{story}', 'StoriesController@edit')->name('new.stories.edit.item');

            Route::get('/{level}/{category?}/{sub_category?}', 'StoriesController@index')->name('new.stories.index');

            Route::get('{level}/{category}/{sub_category}/add-story', 'StoriesController@addItem')->name('new.stories.add.item');

            Route::post('update-item/{story}', 'StoriesController@updateItem')->name('new.stories.update.item');

            Route::post('/{level}/{parent?}', 'StoriesController@createCategory')->name('new.stories.create.category')->where('level', 'beginner|intermediate|advanced');

            Route::post('store-item/{category_id}', 'StoriesController@storeItem')->name('new.stories.store.item');
            Route::post('delete-item/{story}', 'StoriesController@deleteItem')->name('new.stories.delete.item');

            Route::post('item-visibility', 'StoriesController@visibility')->name('new.stories.visibility.item');
        });
    });

    Route::prefix('news')->group(function () {
        Route::get('/', 'NewsController@index')->name('news.index');
        Route::post('/store', 'NewsController@store')->name('news.store');
        Route::get('edit/{news}', 'NewsController@edit')->name('news.edit.item');
        Route::post('update-item/{news}', 'NewsController@updateItem')->name('news.update.item');
        Route::get('/delete/{news}', 'NewsController@delete')->name('news.delete');
        Route::post('item-visibility', 'NewsController@visibility')->name('news.visibility.item');
    });

    Route::prefix('info')->group(function () {
        Route::get('/help', 'AdminController@help')->name('info.help');
        Route::post('/store', 'AdminController@store')->name('info.store');
    });

    Route::group(['prefix' => 'faq'], function () {
        Route::get('/', 'FaqController@index')->name('faq.index');
        Route::get('/create', 'FaqController@create')->name('faq.create');
        Route::get('/update/{id}', 'FaqController@update')->name('faq.update');
        Route::get('/remove/{id}', 'FaqController@remove')->name('faq.remove');
        Route::post('/save/{id?}', 'FaqController@save')->name('faq.save');
    });

    Route::group(['prefix' => 'terms-of-use'], function () {
        Route::get('/', 'TermsOfUseController@index')->name('terms-of-use.index');
        Route::get('/create', 'TermsOfUseController@create')->name('terms-of-use.create');
        Route::get('/update/{id}', 'TermsOfUseController@update')->name('terms-of-use.update');
        Route::get('/remove/{id}', 'TermsOfUseController@remove')->name('terms-of-use.remove');
        Route::post('/save/{id?}', 'TermsOfUseController@save')->name('terms-of-use.save');
    });

    Route::group(['prefix' => 'privacy-policy'], function () {
        Route::get('/', 'PrivacyPolicyController@index')->name('privacy-policy.index');
        Route::get('/create', 'PrivacyPolicyController@create')->name('privacy-policy.create');
        Route::get('/update/{id}', 'PrivacyPolicyController@update')->name('privacy-policy.update');
        Route::get('/remove/{id}', 'PrivacyPolicyController@remove')->name('privacy-policy.remove');
        Route::post('/save/{id?}', 'PrivacyPolicyController@save')->name('privacy-policy.save');
    });
});

///////////////////////// END ADMIN PANEL /////////////////////////


//Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');

Auth::routes(['verify' => true, 'register' => false]);
