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

/*Route::get('/', function () {
    return view('welcome');
});
*/
// '/' url uses WordController@index function
Route::get('/', 'WordController@index');

// Route where user inputs data and makes POST request
Route::post('/data', 'WordController@data')->name('data');