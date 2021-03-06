<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use \App\Http\Controllers\Traits\Image;

    protected $fillable = [
        'title', 'description', 'image', 'visible'
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }

    protected static function boot()
    {
        static::deleting(function ($model) {
            $model->deleteAudios();

            $model->getImagePath('news', false, function ($image) {
                unlink($image);
            });

            $model->getImagePath('news', true, function ($image) {
                unlink($image);
            });
        });

        parent::boot(); // TODO: Change the autogenerated stub
    }
}
