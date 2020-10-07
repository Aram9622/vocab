<?php

namespace App\Http\Controllers\Api\v1;

use App\Models\Category;
use Illuminate\Http\Request;

class NewVerbsController extends ApiController
{
    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => 'verbs', 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }

        return compact('categories', 'category', 'sub_category');
    }
}
