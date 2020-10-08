<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Models\Category;
use App\Models\Conversation;
use App\Models\Exercise;
use App\Models\Phrase;
use App\Models\Verb;
use App\Models\Word;
use App\Models\Story;

trait Categories
{
    /**
     * @var Word[]|Phrase[]|Verb[]|Story[]|Conversation[]|Exercise[]|null
     */
    protected $items;

    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if ($level && $category && $sub_category) {
            $this->setItems($sub_category->id);
        }

        $items = $this->items;

        if (!$category) {
            $categories = Category::where(['type' => $this->type, 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', $category->id)->get();
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

    public function state($type, $current_state)
    {

    }

    /**
     * @param $category_id
     * @return Word[]|Phrase[]|Verb[]|Story[]|Conversation[]|Exercise[]|null
     */
    public function setItems($category_id)
    {
        $map = function ($model) {
            $model->showAssetPath = true;

            $model->image = $model->getCategoriesImagePath(true);
            $model->image_thumb = $model->getCategoriesImagePath(true, true);

            $model->record_en = $model->getAudioPath('en');
            $model->record_es = $model->getAudioPath('es');

            return $model;
        };

        if ($this->type == 'words') {
            $this->items = Word::where('category_id', $category_id)->get()->map($map);
        }

        if ($this->type == 'phrases') {
            $this->items = Phrase::where('category_id', $category_id)->get()->map($map);
        }

        if ($this->type == 'verbs') {
            $this->items = Verb::where('category_id', $category_id)->get()->map($map);
        }

        if ($this->type == 'stories') {
            $this->items = Story::where('category_id', $category_id)->get()->map($map);
        }

        if ($this->type == 'conversations') {
            $this->items = Conversation::where('category_id', $category_id)->get()->map($map);
        }

        if ($this->type == 'exercises') {
            $this->items = Exercise::where('category_id', $category_id)->get()->map($map);
        }

        return $this->items;
    }
}
