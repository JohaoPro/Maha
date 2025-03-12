<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/upload-portada', function (Request $request) {
    $request->validate([
        'imagen' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);
    $request->file('imagen')->storeAs('public', 'portada.jpg');

    return back()->with('success', 'Imagen de portada actualizada.');
})->name('upload.portada');

Route::get('/', function () {
    return view('welcome');
});
