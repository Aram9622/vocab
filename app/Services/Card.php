<?php

namespace App\Services;

use App\ItemState;
use Carbon\Carbon;

class Card
{
    protected $type = 'learning';

    protected $model;

    public function __construct()
    {
        $this->model = new ItemState();
    }

    public static function filter($type, $current_state, $interval = 0)
    {
        $model = new \App\ItemState(['type' => $type]);

        $query = $model->where('user_id', auth()->id())
            ->where('type', $type)
            ->where('current_state', $current_state)
            ->whereHas('joinedModel', function ($query) use ($type) {
                $query->whereHas('category', function ($query) use ($type) {
                    $query->where('type', $type);
                });
            })
            ->where('current_state', $current_state);

        $all = $query->get();

        if ($interval = intval($interval)) {
            $query = $query->whereDate('updated_at', '>=', Carbon::now()->addDays("-$interval"));
        }

        $items = $query->get();

        return [
            'all' => $all,
            'items' => $items,
        ];
    }

    public function getItems($count = 5)
    {
        //$items =
    }
}
