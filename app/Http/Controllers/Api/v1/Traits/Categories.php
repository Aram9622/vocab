<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Models\Category;

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

        return compact('categories', 'category', 'sub_category');
    }

    public function collection(Category $category = null, Category $sub_category = null)
    {
        $beginner = $this->index('beginner', $category, $sub_category);
        $intermediate = $this->index('intermediate', $category, $sub_category);
        $advanced = $this->index('advanced', $category, $sub_category);

        return compact('beginner', 'intermediate', 'advanced');
    }
}
