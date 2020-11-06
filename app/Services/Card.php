<?php

namespace App\Services;

use App\CardItem;
use App\Http\Controllers\Api\v1\Traits\Actions;
use App\ItemState;
use Carbon\Carbon;

class Card
{
    use Actions;

    protected $state = 'learning';

    protected $types = ['words', 'phrases', 'verbs'];

    protected static $current_state_compare_operator = '=';

    /**
     * @var ItemState
     */
    protected $model;

    /**
     * @var CardItem
     */
    private $cardItemModel;

    protected $limit;

    public static $filterQuery;

    public function __construct($limit = 5)
    {
        $this->model = new ItemState();

        $this->cardItemModel = new CardItem();

        $this->limit = $limit;
    }

    public function all()
    {
        return $this->cardItemModel->with('itemState')->has('itemState')->where('user_id', auth()->id())->get()->map(function ($model) {
            $model = $model->itemState;
            $this->correctAttributes($model);
            return $model;
        });
    }

    public static function filter($type, $current_state, $interval = 0, $limit = 0)
    {
        $model = new \App\ItemState(['type' => $type]);

        $query = $model->where('user_id', auth()->id())
            ->where('current_state', self::$current_state_compare_operator, $current_state);

        if (is_callable($callableQuery = self::$filterQuery)) {
            $query = $callableQuery($query);
        }

        if (!is_null($type)) {
            $query = $query->whereHas('joinedModel', function ($query) use ($type) {
                $query->whereHas('category', function ($query) use ($type) {
                    $query->where('type', $type);
                });
            })->where('type', $type);
        }

        if ($limit) {
            $query = $query->limit($limit);
        }

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

    public function getItems()
    {
        $limit = $this->limit;

        $types = $this->types;

        self::$current_state_compare_operator = '<>';

        self::$filterQuery = function (\Illuminate\Database\Eloquent\Builder $query) {
            return $query->has('notInCardItems');
        };

        $map = function (&$model) {
            if ($model instanceof ItemState) {
                $stateModel = $model;
                $model = $model->joinedModel;
            } else {
                $stateModel = ItemState::query()->where('item_id', $model->id)->where('user_id', auth()->id())->where('type', $model->type)->first();
            }

//            $model->type = $this->getFactoryType($model);

            if ($stateModel && $stateModel->current_state == 'learned') {
                unset($model);
                return false;
            }

            $this->correctAttributes($model);

            return $model;
        };

        $items = self::filter(null, 'learned', 0, $this->limit)['items']->map($map)->reject(function ($value) {
            return $value === false;
        })->toArray();

        // if count is not equal to the limit then pushing new items which have "beginner", "intermediate" or "advanced" types
        if (count($items) < $limit) {
            $limit -= count($items);

            foreach ($types as $type) {
                if (count($items) == $this->limit) {
                    break;
                }

                $model = $this->factory($type);

                $beginners = $model->newQuery()->whereHas('category', function ($query) {
                    $query->where('level', 'beginner');
                })->limit($limit)->get()->map($map)->reject(function ($value) {
                    return $value === false;
                })->toArray();

                $intermediates = $advanced = [];

                if (count($beginners) < $limit) {
                    $limit -= count($beginners);

                    $intermediates = $model->newQuery()->whereHas('category', function ($query) {
                        $query->where('level', 'intermediate');
                    })->limit($limit)->get()->map($map)->reject(function ($value) {
                        return $value === false;
                    })->toArray();

                    if (count($beginners) < $limit) {
                        $limit -= count($beginners);

                        $advanced = $model->newQuery()->whereHas('category', function ($query) {
                            $query->where('level', 'advanced');
                        })->limit($limit)->get()->map($map)->reject(function ($value) {
                            return $value === false;
                        })->toArray();
                    }
                }

                $items = array_merge($items, $beginners, $intermediates, $advanced);
            }
        }

        self::$current_state_compare_operator = '=';

        return $items;
    }

    /**
     * @param $array array
     */
    public function setItems(array $array) : void
    {
        foreach ($array as $item) {
//            if (!in_array($item->type, ['default', 'learning', 'learned', 'in_card'])) {
//                continue;
//            }

            //-- set new items with type in_card
            $model = clone $this->model;
            $model = $model->where(['item_id' => $item['item_id'], 'user_id' => auth()->id()])->first() ?: $model;

            if (!$model->id) {
                $model->fill(['item_id' => $item['item_id'], 'user_id' => auth()->id(), 'type' => $item['type'], 'current_state' => 'in_card'])->save();
            }
            //--

            //-- add mew items with type in_card to card_items table if no exists
            $cardItemModel = $this->cardItemModel->where('item_state_id', $model->id)->where('user_id', auth()->id())->first() ?: $this->cardItemModel;
            $cardItemModel->item_state_id = $model->id;
            $cardItemModel->user_id = auth()->id();
            $cardItemModel->save();
            //--
        }
    }
}
