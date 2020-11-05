<?php

namespace App\Services;

use App\CardItem;
use App\ItemState;
use App\Traits\ModelFactory;
use Carbon\Carbon;

class Card
{
    use ModelFactory;

    protected $state = 'learning';

    protected $types = ['words', 'phrases', 'verbs'];

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

    public static function filter($type, $current_state, $interval = 0, $limit = 0)
    {
        $model = new \App\ItemState(['type' => $type]);

        $query = $model->where('user_id', auth()->id())
            ->where('current_state', $current_state)
            ->where('current_state', $current_state);

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
            'all' => $all->map(function (&$model) {
                $model->type = $this->getFactoryType($model);
                return $model;
            }),
            'items' => $items->map(function (&$model) {
                $model->type = $this->getFactoryType($model);
                return $model;
            }),
        ];
    }

    public function getItems()
    {
        $limit = $this->limit;

        $types = $this->types;

        self::$filterQuery = function (\Illuminate\Database\Eloquent\Builder $query) {
            return $query->has('notInCardItems');
        };

        $items = self::filter(null, $this->state, 0, $this->limit)['items']->toArray();

        // if count is not equal to the limit then pushing new items which have "beginner", "intermediate" or "advanced" types
        if (count($items) < $limit) {
            $limit -= count($items);

            foreach ($types as $type) {
                if (count($items) == $this->limit) {
                    break;
                }

                $model = $this->modelFactory($type);

                $beginners = $model->newQuery()->whereHas('category', function ($query) {
                    $query->where('level', 'beginner');
                })->limit($limit)->get()->toArray();

                $intermediates = $advanced = [];

                if (count($beginners) < $limit) {
                    $limit -= count($beginners);

                    $intermediates = $model->newQuery()->whereHas('category', function ($query) {
                        $query->where('level', 'intermediate');
                    })->limit($limit)->get()->toArray();

                    if (count($beginners) < $limit) {
                        $limit -= count($beginners);

                        $advanced = $model->newQuery()->whereHas('category', function ($query) {
                            $query->where('level', 'advanced');
                        })->limit($limit)->get()->toArray();
                    }
                }

                $items = array_merge($items, $beginners, $intermediates, $advanced);
            }
        }

        return $items;
    }

    /**
     * @param $array array
     */
    public function setItems(array $array) : void
    {
        foreach ($array as $item) {
            if (!in_array($item->type, ['default', 'learning', 'learned', 'in_card'])) {
                continue;
            }

            //-- set new items with type in_card
            $model = clone $this->model;
            $model = $model->where(['item_id' => $item->item_id, 'user_id' => auth()->id()])->find() ?: $model;

            if (!$model->id) {
                $model->fill(['item_id' => $item->item_id, 'user_id' => auth()->id(), 'type' => $item->type, 'current_state' => 'in_card'])->save();
            }
            //--

            //-- add mew items with type in_card to card_items table if no exists
            $cardItemModel = $model->cardItem ?: clone $this->cardItemModel;
            $cardItemModel->item_state_id = $model->id;
            $cardItemModel->user_id = auth()->id();
            $model->save();
            //--
        }
    }
}
