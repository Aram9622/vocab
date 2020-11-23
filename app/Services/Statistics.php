<?php

namespace App\Services;

use App\ItemState;
use Carbon\Carbon;

class Statistics
{
    public const INTERVAL_WEEK = 7;
    public const INTERVAL_MONT = 30;
    public const INTERVAL_YEAR = 365;

    public function getStatisticsByInterval($interval, $_date = null)
    {
        $_date = $_date ?: Carbon::now();

        $query = ItemState::query()->where('user_id', 7)
            ->selectRaw('type, DATE(updated_at) as date')
            ->where('current_state', 'learned')
            ->orderBy('updated_at');

        if ($interval == self::INTERVAL_WEEK) {
            $date = $_date->startOfWeek()->toDateString();

            $query = $query
                ->whereDate('updated_at', '>=', $date)
                ->whereDate('updated_at', '<=', $_date->toDateString());
        } elseif ($interval == self::INTERVAL_MONT) {
            $date = $_date->startOfMonth()->toDateString();

            $query = $query
                ->whereDate('updated_at', '>=', $date)
                ->whereDate('updated_at', '<', $_date->endOfMonth()->addDays(1)->toDateString());
        } elseif ($interval == self::INTERVAL_YEAR) {
            $year = $_date->year;
            $learned = [];
            $learnedCount = 0;

            for ($i = 1; $i <= 12; $i++) {
                $date = Carbon::createFromDate($year, $i);
                $learned[$i-1] = $this->getStatisticsByInterval(self::INTERVAL_MONT, $date);
                $learnedCount += $learned[$i-1]['learnedCount'] ?? 0;
            }

            return ['learnedCount' => $learnedCount, 'learned' => $learned];
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

        if ($interval == self::INTERVAL_MONT) {
            $this->sortByWeeks($learned, $_date);
        }

        return ['learnedCount' => $learnedCount, 'learned' => $learned];
    }

    public function sortByWeeks(&$array, $_date)
    {
        $year = $_date->year;
        $month = $_date->month;

        // $numberOfWeeks = floor($_date->daysInMonth / Carbon::DAYS_PER_WEEK);

        $newArray = $start = $end = [];

        $j = $k = 1;
        for ($i = 1; $i <= $_date->daysInMonth; $i++) {
            Carbon::createFromDate($year, $month, $i);
            $start[$j] = Carbon::createFromDate($year, $month, $i)->startOfWeek()->toDateString();
            $end[$j] = Carbon::createFromDate($year, $month, $i)->endOfweek()->toDateString();

            //---------------

            foreach ($array as $key => $value) {
                // condition for every week
                if (strtotime($value['date']) >= strtotime($start[$j]) && strtotime($value['date']) <= strtotime($end[$j])) {
                    if (empty($newArray[$k])) {
                        $newArray[$k] = ['count' => 0, 'dates' => [], 'days' => []];
                    }

                    $newArray[$k]['count'] += $value['count'];
                    $newArray[$k]['dates'][] = $value['date'];
                    $newArray[$k]['days'][] = $value['day'];
                } else {
                    $k++;
                }
            }

            //---------------

            $i += 7;
            $j++;
        }

        print_r($_date->toDateString());
        print_r($start);
        print_r($end);

        $array['pointsByWeek'] = array_values($newArray);
    }
}
