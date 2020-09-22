<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Story extends Model
{
    protected $fillable = [
    	'category_id', 'story_en', 'record_en', 'story_es', 'record_es', 'image', 'eg_link','visible'
    ];

    public function category(){
    	return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }

}
