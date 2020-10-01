<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Requests\Api\v1\UpdateUserProfile;
use App\Http\Resources\v1\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Exceptions\UserNotDefinedException;
use Illuminate\Support\Facades\Storage;
use Image;

class UserController extends ApiController
{
    public function show()
    {
        return $this->getUserDetails();
    }

    public function changePassword(Request $request)
    {
        $data = $request->all();
        $user = Auth::guard('api')->user();

        $validator = Validator::make($request->all(), [
            'oldPassword' => 'required|string|max:100',
            'newPassword' => 'required|string|min:6|max:100',
            'c_newPassword' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        //checking the old password first
        $check = Auth::guard('web')->attempt([
            'username' => $user->username,
            'password' => $data['oldPassword']
        ]);

        if ($check) {
            $user->password = bcrypt($data['newPassword']);
            $user->isFirstTime = false; //variable created by me to know if is the dummy password or generated by user.
            $user->token()->revoke();
            $token = $user->createToken('newToken')->accessToken;

            //Changing the type
            $user->save();

            return json_encode(array('token' => $token)); //sending the new token
        }

        return response()->json(['error' => ['oldPassword' => "Wrong password information"]], 401);
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
                ->resize(400, 400)
                ->save(storage_path('app/' . $url));

            $user->image()->updateOrCreate(
                ['imageable_id' => $user->id],
                ['url' => $url]
            );
        }

        return new UserResource($user);
    }
}
