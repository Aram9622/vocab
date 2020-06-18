<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Requests\Api\v1\UpdateUserProfile;
use App\Http\Resources\v1\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Exceptions\UserNotDefinedException;
use Illuminate\Support\Facades\Storage;
use Image;

class UserController extends ApiController
{
    public function show()
    {
        $user = auth()->userOrFail();

        return new UserResource($user);
    }

    /**
     * @param UpdateUserProfile $request
     * @return UserResource|\Illuminate\Http\JsonResponse
     */
    public function update(UpdateUserProfile $request)
    {
        $validated = $request->validated();

        try {
            $user = auth()->userOrFail();
        } catch (UserNotDefinedException $e) {
            return response()->json(['error' => $e->getMessage()]);
        }

        $user->update([
            'name' => $validated['name'],
            'email' => $validated['email'],
        ]);

        if(isset($validated['password'])) {
            $user->update(['password' => Hash::make($validated['password'])]);
        }

        if($request->hasFile('avatar')){
            $file = $request->file('avatar');
            $name = uniqid().'.'.strtolower($file->getClientOriginalExtension());
            $url = 'public/images/profiles/' . $name;
            if($user->image()->first() && storage_path($user->image()->first()->url)) {
                Storage::delete($user->image()->first()->url);
            }

            Image::make($file)
                ->resize(300, 300)
                ->save(storage_path('app/' . $url));

            $user->image()->updateOrCreate(
                ['imageable_id' => $user->id],
                ['url' => $url]
            );
        }

        return new UserResource($user);
    }
}
