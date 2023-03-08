<?php

use App\Models\Service;
use App\Models\User;
use App\Models\UserData;
use Illuminate\Support\Facades\Log;
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

Route::middleware(['cors'])->group(function () {
    Route::post('/','isphero@isphero');
});

Route::get('/', function () {return view('welcome');});

// Routes for the user resource
Route::get('/users', function () {return App\Models\User::with('userData')->get();});

Route::get('/user/{id}', function ($id) {return App\Models\User::with('userData')->findOrfail($id);});

Route::delete('/user/{id}', function ($id) {return App\Models\User::destroy($id);});

Route::delete('/user/{id}', function ($id) {
    $user = App\Models\User::findOrfail($id);
    if ($user->services()->count() > 0) return response()->json(['message' => 'User has services'], 403);

    if ($user->waitingDomains()->count() > 0) return response()->json(['message' => 'User has waiting domains'], 403);

    if ($user->userData()->count() > 0) $user->userData()->delete();

    return $user->delete();
});

Route::post('/user', function () {
    $body = request()->input('body');
    $username = $body['username'];
    $role = $body['role'];
    $email = $body['email'];
    $userData = $body['userData'];
    Log::info(json_encode($body));

    if (User::where('username', $username)->count() > 0) return response()->json(['message' => 'Username already exists'], 400);
    if (User::where('email', $email)->count() > 0) return response()->json(['message' => 'Email already exists'], 400);
    User::create([
        'username' => $username,
        'role' => $role,
        'email' => $email,
    ]);
    $lastInsertedId = User::orderBy('id', 'desc')->first()->id;
    $userData['user_id'] = $lastInsertedId;
    UserData::create($userData);
    return response()->json(['message' => 'User created'], 200);
});

Route::put('/user/{id}', function ($id) {
    $body = request()->input('body');
    $userData = $body['userData'];
    $username = $body['username'];
    $role = $body['role'];
    $email = $body['email'];
    if (User::where('username', $username)->where('id', '!=', $id)->count() > 0) return response()->json(['message' => 'Username already exists'], 400);
    if (User::where('email', $email)->where('id', '!=', $id)->count() > 0) return response()->json(['message' => 'Email already exists'], 400);
    $userData['user_id'] = $id;
    User::findOrfail($id)->update([
        'username' => $username,
        'role' => $role,
        'email' => $email,
    ]);
    if (UserData::where('user_id', $id)->count() == 0) UserData::create($userData);
    else UserData::where('user_id', $id)->update($userData);
    return response()->json(['message' => 'User updated'], 200);
});


// Routes for the user and related services
Route::get('/user/{id}/services', function ($id) {
    return Service::with('article')->where('user_id', $id)->get();
});

// Routes for services
Route::get('/services', function () {
    return Service::with('article')->get();
});

// Get Services which expire in the next 7 days or less AND cancelled is false.

Route::get('/services/expire_soon', function () {
    return Service::with('article')->where('date_expired', '<=', date('Y-m-d', strtotime('+7 days')))->where('is_cancelled', false)->get();
});

// Routes for NewsLetter List
Route::get('/newsletter', function () {return App\Models\NewsLetter::all();});

Route::delete('/newsletter/{id}', function ($id) {return App\Models\NewsLetter::destroy($id);});

// Routes to get the list of languages
Route::get('/languages', function () {return App\Models\Language::all();});

Route::post('/language', function () {
    $body = request()->input('body');
    $code = $body['code'];
    $name = $body['name'];
    if (App\Models\Language::where('code', $code)->count() > 0) return response()->json(['message' => 'Language code already exists'], 400);
    if (App\Models\Language::where('name', $name)->count() > 0) return response()->json(['message' => 'Language name already exists'], 400);
    App\Models\Language::create([
        'code' => $code,
        'name' => $name,
    ]);
    return response()->json(['message' => 'Language created'], 200);
});

// Get all texts where "lang_code" is "en"
Route::get('/texts', function () {return App\Models\Text::where('lang_code', 'en')->get();});

// POST Route which gets the lang_code, key_text_id and translate text to insert in the database
Route::post('/text', function () {
    $lang_code = request()->input('lang_code');
    $key_text_id = request()->input('key_text_id');
    $translate = request()->input('translate');

    if (App\Models\Text::where('lang_code', $lang_code)->where('key_text_id', $key_text_id)->count() > 0) return response()->json(['message' => 'Text already exists'], 400);
    App\Models\Text::create([
        'lang_code' => $lang_code,
        'key_text_id' => $key_text_id,
        'translate' => $translate,
    ]);
    return response()->json(['message' => 'Text created'], 200);
});
