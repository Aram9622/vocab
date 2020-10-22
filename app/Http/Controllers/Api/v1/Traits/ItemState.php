<?php

namespace App\Http\Controllers\Api\v1\Traits;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

trait ItemState
{
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
                    $array['all']->map(function ($model) use (&$items, $state) {
                        $items[$state]['all'][] = $model;
                    });
                }

                if ($array['items']->count()) {
                    $array['items']->map(function ($model) use (&$items, $state) {
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
}
