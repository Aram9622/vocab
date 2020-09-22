<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Controllers\Traits\FileUploadTrait;

class Category extends Model
{
	protected $table = 'categories';

    public static function createItem($type, $level = null, $parent_id, $request){
    	$category            = new Category;
    	$category->type      = $type;
    	$category->level     = $level;
    	$category->name      = $request['name'];
    	if ($request->hasFile('image')) {
            if ($level == null) {
    	       $image_path = 'categories/'.$type;
            }else {
               $image_path = 'categories/'.$type.'/'.$level;
            }
    	    $request    = FileUploadTrait::saveFiles($request, $image_path);
    		$category->image = $request->image;
    	}
    	$category->parent_id = ($parent_id == 0) ? null : $parent_id;
    	return $category->save();
    }

    public function parent(){
        return $this->belongsTo('App\Models\Category', 'parent_id', 'id');
    }
}
