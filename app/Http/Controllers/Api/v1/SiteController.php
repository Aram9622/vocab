<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Http\Controllers\Controller;
use App\Models\Faq;
use App\Models\Option;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    use Categories;

    public function general(Request $request)
    {
        $query = Faq::query();

        if (in_array($request->type, ['faq', 'terms-of-use', 'privacy-policy'])) {
            $query = $query->where('type', $request->type);
        }

        $extraPages = $query->get();

        $helpPage = Option::item('help');

        return compact('extraPages', 'helpPage');
    }

    public function categoryItem($id, Request $request)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        $model = $this->factory($request->type)->with('category')->findOrFail($id);

        $this->setAssetPath($model);

        if ($model->category) {
            $this->setAssetPath($model->category);

            if ($model->category->parent) {
                $this->setAssetPath($model->category->parent);
            }
        }

        return $model;
    }
}
