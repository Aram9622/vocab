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
            $date = $_date;

            if ($interval == 7) {
                $date = $_date->startOfWeek()->toDateString();
            } elseif ($interval == 30) {
                $date = Carbon::now()->startOfMonth()->addDays('-3')->startOfMonth()->toDateString();
            } elseif ($interval == 365) {
                $date = Carbon::now()->startOfYear();

                $learned = [];

                $learned[] = $this->getStatisticsByInterval(30, $date);

                $learnedCount = $learned[0]['learnedCount'] ?? 0;

                for ($i = 1; $i <= 11; $i++) {
                    $learned[$i] = $this->getStatisticsByInterval(30, $date->addMonths($i + 1));
                    $learnedCount += $learned[$i]['learnedCount'] ?? 0;
                }

                return ['learnedCount' => $learnedCount, 'learned' => $learned];
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

        if ($interval == 30) {
            $learned = $this->sortByWeeks($learned, $_date);
        }

        return ['learnedCount' => $learnedCount, 'learned' => $learned];
    }

    public function sortByWeeks($array, $_date)
    {
        $year = $_date->year;
        $month = $_date->month;
        $date = Carbon::createFromDate($year, $month);

//        $numberOfWeeks = floor($date->daysInMonth / Carbon::DAYS_PER_WEEK);

        $newArray = $start = $end = [];

        $j = 1;
        $k = 1;
        for ($i = 1; $i <= $date->daysInMonth; $i++) {
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

        $array['pointsByWeek'] = array_values($newArray);

        return $array;
    }

    public function sortByMonths(&$array)
    {

    }
}
