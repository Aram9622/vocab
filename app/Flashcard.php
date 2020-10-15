<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flashcard extends Model
{
    protected $fillable = ['group_id', 'word_en', 'word_es', 'image'];

    public function group()
    {
        return $this->hasOne(FlashcardGroup::class, 'id', 'group_id');
    }
}
