<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Resources\v1\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\UserNotDefinedException;

class UserController extends ApiController
{
    public function show()
    {
        try {
            $user = auth()->userOrFail();
        } catch (UserNotDefinedException $e) {
            return response()->json(['error' => $e->getMessage()]);
        }

        return new UserResource($user);
    }
}
