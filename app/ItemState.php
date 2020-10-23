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

        echo $className; die;

        return $this->hasOne($className, 'id', 'item_id');
    }
}
