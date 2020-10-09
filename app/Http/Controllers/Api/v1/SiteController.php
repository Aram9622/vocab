<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    use Categories;

    public function categoryItem($id, Request $request)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        $model = $this->factory($request->type)->with('category')->findOrFail($id);

        $model->showAssetPath = true;

        $model->image = $model->getCategoriesImagePath(true);
        $model->image_thumb = $model->getCategoriesImagePath(true, true);

        $model->record_en = $model->getAudioPath('en');
        $model->record_es = $model->getAudioPath('es');

        return $model;
    }
}
