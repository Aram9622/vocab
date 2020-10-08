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
        $this->items = $this->factory($this->type)->with(['category' => function ($query) use ($type) {
            $query->where('type', $type);
        }])->where('current_state', $current_state)->get()->map($this->mapping());

        return $this->items;
    }

    /**
     * @param $category_id
     * @return Word[]|Phrase[]|Verb[]|Story[]|Conversation[]|Exercise[]|null
     */
    public function setItems($category_id)
    {
        $this->items = $this->factory($this->type)->where('category_id', $category_id)->get()->map($this->mapping());

        return $this->items;
    }

    public function mapping()
    {
        return function ($model) {
            $model->showAssetPath = true;

            $model->image = $model->getCategoriesImagePath(true);
            $model->image_thumb = $model->getCategoriesImagePath(true, true);

            $model->record_en = $model->getAudioPath('en');
            $model->record_es = $model->getAudioPath('es');

            return $model;
        };
    }

    /**
     * @param $type
     * @return Conversation|Exercise|Phrase|Story|Verb|Word|null
     */
    public function factory($type)
    {
        $model = null;

        switch ($type) {
            case "words":
                $model = new Word();
                break;
            case "phrases":
                $model = new Phrase();
                break;
            case "verbs":
                $model = new Verb();
                break;
            case "stories":
                $model = new Story();
                break;
            case "conversations":
                $model = new Conversation();
                break;
            case "exercises":
                $model = new Exercise();
                break;
        }

        return $model;
    }
}
