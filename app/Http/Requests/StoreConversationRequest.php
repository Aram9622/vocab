<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreConversationRequest extends FormRequest
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
            'conversation_en'   => 'required|string|max:255',
            'conversation_es'   => 'required|string|max:255',
            'record_en' =>'required|mimes:mpeg,mpga,mp3,mp4,wav,aac,mp4|max:1024',
            'record_es' =>'required|mimes:mpeg,mpga,mp3,mp4,wav,aac,mp4|max:1024',
            'eg_link'   => 'required|string|max:255',
            'image'     => 'required|file|mimes:jpeg,jpg,png,gif',
        ];
    }
}
