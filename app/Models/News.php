<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $fillable = [
    	'title','description','image','visible'
    ];

    public function category(){
    	return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }
}
