<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class UpdateExerciseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];
        if ($this->type == 2) {
            $rules = [
                'words' => 'required|array',
                'words.*' => 'nullable|string|max:255',
            ];
        }

        return array_merge([
            //'category_id' => 'required|exists:categories,id',
            'type' => 'nullable|numeric|min:1|max:2',
            'title' => 'required|string|max:255',
            'exercise_en' => 'required|string',
            'exercise_es' => 'required|string',

            'record_en' =>'nullable|file|mimes:audio/mpeg,mpga,mp3,mp4,wav,aac',
            'record_es' =>'nullable|file|mimes:audio/mpeg,mpga,mp3,mp4,wav,aac',
            'image' => 'nullable|file|mimes:jpeg,jpg,png,gif',
        ], $rules);
    }
}
