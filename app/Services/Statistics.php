<?php

namespace App\Services;

use App\ItemState;
use Carbon\Carbon;

class Statistics
{
    public function getStatisticsByInterval($interval = 0, $_date = null)
    {
        $_date = $_date ?: Carbon::now();

        if ($interval) {
            $date = $_date->addDays("-$interval")->toDateString();

            if ($interval == 7) {
                $date = $_date->startOfWeek()->toDateString();
            } elseif ($interval == 30) {
                $date = $_date->startOfMonth()->toDateString();
            } elseif ($interval == 365) {
                $date = Carbon::now()->startOfYear()->toDateString();
            }

            $query = ItemState::query()->where('user_id', 7)
                ->selectRaw('type, DATE(updated_at) as date')
                ->where('current_state', 'learned')
                ->whereDate('updated_at', '>=', $date)
                ->whereDate('updated_at', '<=', Carbon::now()->toDateString())
                ->orderBy('updated_at');
        } else {
            $query = ItemState::selectRaw('type, DATE(updated_at) as date')
                ->where('user_id', auth()->id())
                ->where('current_state', 'learned')
                ->orderBy('updated_at');
        }

        $learned = [];

        $query->get()->map(function ($model) use (&$learned) {
            if (!isset($learned[$model->date])) {
                $learned[$model->date] = ['count' => 0, 'date' => $model->date, 'day' => Carbon::parse($model->date)->dayName];
            }
            $learned[$model->date]['count'] += 1;
        });

        $learnedCount = $query->count();

        $learned = array_values($learned);

        return ['learnedCount' => $learnedCount, 'learned' => $learned];
    }
}
