<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\ItemState as ItemStateModel;
use App\Models\Category;
use App\Models\Conversation;
use App\Models\Exercise;
use App\Models\Phrase;
use App\Models\Verb;
use App\Models\Word;
use App\Models\Story;

trait Categories
{
    use Actions, ItemState;

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

    /**
     * @param $category_id
     * @return Word[]|Phrase[]|Verb[]|Story[]|Conversation[]|Exercise[]|null
     */
    public function setItems($category_id)
    {
        $this->items = $this->factory($this->type)
            ->newQuery()
            ->leftJoin('studied', 'studied.studied_id', "{$this->type}.id")
            ->when('studied.type', $this->type)
            ->where('category_id', $category_id)
            ->get()
            ->map($this->mapping());

        return $this->items;
    }

    public function mapping($joined = false)
    {
        return function ($model) use ($joined) {
            $model->current_state = 'default';

            $itemState = ItemStateModel::where(['type' => $this->type, 'item_id' => $model->id, 'user_id' => auth()->id()])->first();

            if ($itemState) {
                $model->current_state = $itemState->current_state;
            }

            if ($joined == true) {
                $joinedModel = $model->joinedModel;

                $this->setAssetPath($joinedModel);

                $joinedModel->current_state = $model->current_state;

                $this->correctAttributes($joinedModel);

                return $joinedModel;
            }

            $this->setAssetPath($model);

            $this->correctAttributes($model);

            return $model;
        };
    }

    public function setAssetPath(&$model)
    {
        $model->showAssetPath = true;

        $model->image_thumb = $model->getCategoriesImagePath(true, true);
        $model->image = $model->getCategoriesImagePath(true);

        $model->record_en = $model->getAudioPath('en');
        $model->record_es = $model->getAudioPath('es');
    }
}
