<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FlashcardGroup extends Model
{
    protected $fillable = ['parent_id', 'name'];

    public function parent()
    {
        return $this->hasOne(self::class, 'id', 'parent_id');
    }

    public function subs()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }
}
