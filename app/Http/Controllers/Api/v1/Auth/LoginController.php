<?php

namespace App\Http\Controllers\Api\v1\Auth;

use App\Http\Controllers\Api\v1\ApiController;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class LoginController extends ApiController
{
    public function login(Request $request)
    {
        $creds = $request->only(['email', 'password']);

        if(!$token = auth()->attempt($creds)) {
            return response()->json(['error' => 'Incorrect email/password'], 401);
        }

        $user = auth()->user();

        return response()->json([
            'name'  => $user->name,
            'email' => $user->email,
            'token' => $token
        ]);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
}
