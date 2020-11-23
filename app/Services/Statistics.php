<?php

namespace App\Services;

use App\ItemState;
use Carbon\Carbon;

class Statistics
{
    public const INTERVAL_WEEK = 7;
    public const INTERVAL_MONTH = 30;
    public const INTERVAL_YEAR = 365;

    public function getStatisticsByInterval($interval, $_date = null)
    {
        $_date = $_date ?: Carbon::now();

        $startOMonth = clone $_date->startOfMonth();
        $endOMonth = clone $_date->endOfMonth()->addDays(1);

        $startOfWeek = clone $_date->startOfWeek();
        $endOfWeek = clone $_date->endOfWeek();

        $query = ItemState::query()->where('user_id', 7)
            ->selectRaw('type, DATE(updated_at) as date')
            ->where('current_state', 'learned')
            ->orderBy('updated_at');

        if ($interval == self::INTERVAL_WEEK) {
            echo $startOfWeek->toDateString(), ' ', $endOfWeek->toDateString(); die;
            $query = $query
                ->whereDate('updated_at', '>=', $startOfWeek->toDateString())
                ->whereDate('updated_at', '<=', $endOfWeek->toDateString());
        } elseif ($interval == self::INTERVAL_MONTH) {
            $query = $query
                ->whereDate('updated_at', '>=', $startOMonth->toDateString())
                ->whereDate('updated_at', '<', $endOMonth->toDateString());
        } elseif ($interval == self::INTERVAL_YEAR) {
            $year = $_date->year;
            $learned = [];
            $learnedCount = 0;

            for ($i = 1; $i <= 12; $i++) {
                $date = Carbon::createFromDate($year, $i);
                $learned[$i-1] = $this->getStatisticsByInterval(self::INTERVAL_MONTH, $date);
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

        if ($interval == self::INTERVAL_MONTH) {
            $this->sortByWeeks($learned, $startOMonth);
        }

        return ['learnedCount' => $learnedCount, 'learned' => $learned];
    }

    public function sortByWeeks(&$array, $_date)
    {
        $year = $_date->year;
        $month = $_date->month;
        // $numberOfWeeks = floor($_date->daysInMonth / Carbon::DAYS_PER_WEEK);

        $start = $end = [];
        $j = 1;
        for ($i = 1; $i <= $_date->daysInMonth; $i++) {
            Carbon::createFromDate($year, $month, $i);
            $start[$j] = Carbon::createFromDate($year, $month, $i)->startOfWeek()->toDateString();
            $end[$j] = Carbon::createFromDate($year, $month, $i)->endOfweek()->toDateString();
            $i += 7; $j++;
        }

        $newArray = [];
        foreach ($start as $_key => $_value) {
            foreach ($array as $key => $value) {
                // condition for every week
                if (strtotime($value['date']) >= strtotime($_value) && strtotime($value['date']) <= strtotime($end[$_key])) {
                    if (empty($newArray[$_key])) {
                        $newArray[$_key] = ['count' => 0, 'dates' => [], 'days' => []];
                    }

                    $newArray[$_key]['count'] += $value['count'];
                    $newArray[$_key]['dates'][] = $value['date'];
                    $newArray[$_key]['days'][] = $value['day'];
                }
            }
        }

        $array['pointsByWeek'] = array_values($newArray);
    }
}
