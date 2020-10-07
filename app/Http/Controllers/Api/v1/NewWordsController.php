<?php

namespace App\Http\Controllers\Api\v1;

use App\Models\Category;
use Illuminate\Http\Request;

class NewWordsController extends ApiController
{
    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => 'words', 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }

        $categories = $categories->map(function ($model) {
            $model->showAssetPath = true;
            $model->image_thumb = $model->getImagePath('categories/words/thumb');
            $model->image = $model->getImagePath('categories/words');

            return $model;
        });

        return compact('categories', 'category', 'sub_category');
    }
}
