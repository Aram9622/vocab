<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Models\Category;
use App\Models\Phrase;
use App\Models\Verb;
use App\Models\Word;

trait Categories
{
    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => $this->type, 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }

        $categories = $categories->map(function ($model) {
            $model->showAssetPath = true;
            $model->image_thumb = $model->getCategoriesImagePath(true, true);
            $model->image = $model->getCategoriesImagePath(true);

            return $model;
        });

        $items = null;

        if ($level && $category && $sub_category) {
            $map = function ($model) {
                $model->showAssetPath = true;

                $model->image = $model->getCategoriesImagePath(true);
                $model->image_thumb = $model->getCategoriesImagePath(true, true);

                $model->record_en = $model->getAudioPath('en');
                $model->record_es = $model->getAudioPath('es');

                return $model;
            };

            $type = request()->segment(3);

            if ($type == 'new-words') {
                $items = Word::where('category_id', $sub_category->id)->get()->map($map);
            }

            if ($type == 'new-phrases') {
                $items = Phrase::where('category_id', $sub_category->id)->get()->map($map);
            }

            if ($type == 'new-verbs') {
                $items = Verb::where('category_id', $sub_category->id)->get()->map($map);
            }
        }

        return compact('categories', 'category', 'sub_category', 'items');
    }

    public function collection(Category $category = null, Category $sub_category = null)
    {
        $beginner = $this->index('beginner', $category, $sub_category);
        $intermediate = $this->index('intermediate', $category, $sub_category);
        $advanced = $this->index('advanced', $category, $sub_category);

        return compact('beginner', 'intermediate', 'advanced');
    }
}
