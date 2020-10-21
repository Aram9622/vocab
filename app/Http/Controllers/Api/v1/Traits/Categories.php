<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Models\Category;
use App\Models\Conversation;
use App\Models\Exercise;
use App\Models\Phrase;
use App\Models\Verb;
use App\Models\Word;
use App\Models\Story;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

    public function state($type, $current_state, $interval = 0)
    {
        $this->type = $type;

        $query = $this->factory($this->type)->whereHas('category', function ($query) {
            $query->where('type', $this->type);
        })->where('current_state', $current_state);

        $all = $query->get()->map($this->mapping());

        if ($interval = intval($interval)) {
            $query = $query->whereDate('updated_at', '>=', Carbon::now()->addDays("-$interval"));
        }

        $this->items = $query->get()->map($this->mapping());

        return [
            'all' => $all,
            'items' => $this->items,
        ];
    }

    public function stateCollection($interval = 0)
    {
        $items = [];
        $types = ['words', 'phrases', 'verbs'];
        $states = ['default', 'learning', 'learned'];

        /*
        foreach ($types as $type) {
            foreach ($states as $state) {
                $items[$type][$state] = $this->state($type, $state);
            }
        }
        */

        foreach ($states as $state) {
            if (empty($items[$state])) {
                $items[$state] = ['all' => [], 'items' => []];
            }

            foreach ($types as $type) {
                $array = $this->state($type, $state, $interval);
                if ($array['all']->count()) {
                    $array->map(function ($model) use (&$items, $state) {
                        $items[$state]['all'][] = $model;
                    });
                }

                if ($array['items']->count()) {
                    $array->map(function ($model) use (&$items, $state) {
                        $items[$state]['items'][] = $model;
                    });
                }
            }
        }

        return $items;
    }

    public function stateChange($type, $id, Request $request)
    {
        if (!in_array($request->state, ['default', 'learning', 'learned'])) {
            return ['error' => 'The state param mast be one of these items (default, learning, learned)'];
        }

        $this->type = $type;

        $model = $this->factory($this->type)->findOrFail($id);
        $model->current_state = $request->state;
        $model->save();

        return $model;
    }

    public function stateChangeByCat($type, $category_id, Request $request)
    {
        $this->type = $type;

        $models = $this->factory($this->type)->where('category_id', $category_id)->get();

        DB::beginTransaction();

        $updatedModels = [];

        try {
            foreach ($models as $model) {
                $result = $this->stateChange($type, $model->id, $request);
                if (isset($result['error'])) {
                    DB::rollBack();
                    return $result['error'];
                }
                $updatedModels[] = $result;
            }
        } catch (\Exception $exception) {
            DB::rollBack();
            return [
                'error' => 'There is some problem with your sent data, check the POST data before send',
                'POST' => $request->all()
            ];
        }

        DB::commit();

        return $updatedModels;
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
            $this->setAssetPath($model);

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
