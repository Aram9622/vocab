<?php

namespace App\Http\Controllers\Api\v1\Auth;

use App\Http\Controllers\Api\v1\ApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends ApiController
{
    public function login(Request $request)
    {
        return parent::login($request);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        if (Auth::guest()) {
            return response()->json(['error' => 'You are not logged in - check your access token before logging out']);
        }

        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
}
