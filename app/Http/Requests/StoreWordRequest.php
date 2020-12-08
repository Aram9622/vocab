<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreWordRequest extends FormRequest
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
            'word_en'   => 'required|string|max:255',
            'word_es'   => 'required|string|max:255',
            'record_en' =>'required|file|mimes:audio/mpeg,mpga,mp3,m4a,wav,aac',
            'record_es' =>'required|file|mimes:audio/mpeg,mpga,mp3,m4a,wav,aac',
            'eg_link'   => 'required|string|max:255',
            'image'     => 'required|file|mimes:jpeg,jpg,png,gif|max:2048',
        ];
    }
}
