<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Word extends Model
{
    protected $fillable = [
        'category_id', 'word_en', 'record_en', 'word_es', 'record_es', 'image', 'eg_link', 'visible'
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }
}
