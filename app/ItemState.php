<?php

namespace App;

use App\Traits\ModelFactory;
use Illuminate\Database\Eloquent\Model;

class ItemState extends Model
{
    use ModelFactory;

    protected $fillable = ['user_id', 'item_id', 'type', 'current_state'];

    public function joinedModel()
    {
        $className = get_class($this->modelFactory($this->type));

        return $this->hasOne($className, 'id', 'item_id');
    }

    public function cardItem()
    {
        return $this->hasOne(CardItem::class, 'item_state_id', 'id')
            ->where('card_items.user_id', 'item_states.user_id');
    }

    public function notInCardItems()
    {
        return $this->hasOne(CardItem::class, 'user_id', 'user_id')
            ->where('card_items.item_state_id', '<>', 'item_states.id');
    }
}
