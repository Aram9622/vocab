<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

abstract class ApiController extends Controller
{
    protected $successStatus = 200;

    protected function getUserDetails()
    {
        return [
            'name'   => Auth::user()->name,
            'email'  => Auth::user()->email,
            'avatar' => str_replace("public","storage", Auth::user()->image->url),
            'token'  => Auth::user()->createToken('MyApp')->accessToken
        ];
    }

    protected function login(Request $request)
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            return response()->json($this->getUserDetails(), $this->successStatus);
        } else {
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }
}
