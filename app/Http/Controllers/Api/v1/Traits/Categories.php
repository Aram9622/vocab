<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Models\Category;
use App\Models\Phrase;
use App\Models\Verb;
use App\Models\Word;

trait Categories
{
    protected $items;

    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if ($level && $category && $sub_category) {
            $map = function ($model) {
                $model->showAssetPath = true;

                $model->image = $model->getCategoriesImagePath(true);
                $model->image_thumb = $model->getCategoriesImagePath(true, true);

                $model->record_en = $model->getAudioPath('en');
                $model->record_es = $model->getAudioPath('es');

                return $model;
            };
        }

        $items = null;

        if ($this->type == 'words') {
            $items = Word::where('category_id', $sub_category->id)->get()->map($map);
        }

        if ($this->type == 'phrases') {
            $items = Phrase::where('category_id', $sub_category->id)->get()->map($map);
        }

        if ($this->type == 'verbs') {
            $items = Verb::where('category_id', $sub_category->id)->get()->map($map);
        }

        $this->items = $items;

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
