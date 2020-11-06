<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CardItem extends Model
{
    protected $fillable = ['user_id', 'item_state_id'];

    public function itemState()
    {
        return $this->hasOne(ItemState::class, 'id', 'item_state_id');
    }
}
