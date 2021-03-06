<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Services\Card;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

trait ItemState
{
    public function state($type, $current_state, $interval = 0)
    {
        $this->type = $type;

        $result = Card::filter($type, $current_state, $interval);

        $result['all'] = $result['all']->map($this->mapping(true));

        $this->items = $result['items'] = $result['items']->map($this->mapping(true));

        return $result;
    }

    public function stateCollection($interval = 0)
    {
        $items = [];
        $types = ['words', 'phrases', 'verbs'];
        $states = ['default', 'learning', 'learned'];

        foreach ($states as $state) {
            if (empty($items[$state])) {
                $items[$state] = ['all' => [], 'items' => []];
            }

            foreach ($types as $type) {
                $array = $this->state($type, $state, $interval);
                if ($array['all']->count()) {
                    $array['all']->map(function ($model) use (&$items, $state) {
                        $model->current_state = $state;

                        $items[$state]['all'][] = $model;
                    });
                }

                if ($array['items']->count()) {
                    $array['items']->map(function ($model) use (&$items, $state) {
                        $model->current_state = $state;

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

        DB::beginTransaction();

        $params = ['user_id' => auth()->id(), 'type' => $type, 'item_id' => $id];

        $model = \App\ItemState::where($params)->first() ?: new \App\ItemState();

        $params['current_state'] = $request->state;

        $model->fill($params)->save();

        $this->correctAttributes($model->joinedModel);

        $result = $model->joinedModel;

        if (empty($model->joinedModel)) {
            DB::rollBack();
            return ['error' => "There is no '$type' by id $id"];
        }

        DB::commit();

        $result->current_state = $request->state;

        return $result;
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
}
