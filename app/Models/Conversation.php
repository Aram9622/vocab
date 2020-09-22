<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    protected $fillable = [
        'category_id', 'conversation_en', 'record_en', 'conversation_es', 'record_es', 'image', 'eg_link', 'visible'
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }
}
