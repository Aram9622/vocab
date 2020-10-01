<?php

namespace App\Http\Requests\Api\v1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserProfile extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'      => 'required|string|min:2|max:255',
            'email'     => 'required|string|email|max:255|unique:users,email,' . auth()->id(),
            'password'  => 'nullable|string|min:8|max:255|confirmed',
            'avatar'    => 'nullable|image'
        ];
    }
}
