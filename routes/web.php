<?php

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

Auth::routes();


Route::get('/', function () {
	// return view('welcome');
	return redirect('/login') ;
});


Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function(){


	// ===================== PROJECTS ======================
	Route::get('/projects', 'ProjectController@index')->name('project.show') ;

	Route::get('/projects/create', 'ProjectController@create')->name('project.create') ;

	Route::get('/projects/edit/{id}', 'ProjectController@edit')->name('project.edit') ;

	Route::post('/projects/update/{id}', 'ProjectController@update')->name('project.update') ;

	Route::get('/projects/delete/{id}', 'ProjectController@destroy')->name('project.delete') ;

	// Store the new project from the form posted with the view Above
	Route::post('/projects/store', 'ProjectController@store')->name('project.store');



	// ====================  TASKS =======================
	Route::get('/tasks','TaskController@index')->name('task.show') ;

	Route::get('/tasks/view/{id}','TaskController@view')->name('task.view') ;

	// Display the Create Task View form
	Route::get('/tasks/create', 'TaskController@create')->name('task.create'); 

	// Store the new task from the form posted with the view Above
	Route::post('/tasks/store', 'TaskController@store')->name('task.store');

	// Search view
	Route::get('/tasks/search', 'TaskController@searchTask')->name('task.search');

	// Sort Table
	Route::get('/tasks/sort/{key}', 'TaskController@sort')->name('task.sort') ;

	Route::get('/tasks/edit/{id}','TaskController@edit')->name('task.edit');

	// Route::get('/tasks/edit/{id}', function () {	
	// 	'uses' => 'TaskController@edit',
	// 	'as'  => 'task.edit'
	// });

	Route::get('/tasks/list/{projectid}','TaskController@tasklist')->name('task.list');
	Route::get('/tasks/delete/{id}', 'TaskController@destroy')->name('task.delete') ;
	Route::get('/tasks/deletefile/{id}', 'TaskController@deleteFile')->name('task.deletefile') ;
	Route::post('/tasks/update/{id}', 'TaskController@update')->name('task.update') ;
	Route::get('/tasks/completed/{id}','TaskController@completed')->name('task.completed');

	// =====================  USERS   ============================
	Route::get('/users', 'UserController@index')->name('user.index'); 
	Route::get('/users/list/{id}','UserController@userTaskList')->name('user.list');
	Route::get('/users/create', 'UserController@create')->name('user.create'); 
    Route::post('/users/store', 'UserController@store')->name('user.store'); 
	Route::get('/users/edit/{id}', 'UserController@edit')->name('user.edit'); 
	Route::post('/users/update/{id}', 'UserController@update')->name('user.update') ;
    Route::get('/users/activate/{id}', 'UserController@activate')->name('user.activate') ; 
    Route::get('/users/delete/{id}', 'UserController@destroy')->name('user.delete') ;
    Route::get('/users/disable/{id}', 'UserController@disable')->name('user.disable') ;

});
