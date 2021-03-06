<?php

namespace App\Models;

use App\Studied;
use Illuminate\Database\Eloquent\Model;

class Story extends Model
{
    use \App\Http\Controllers\Traits\Image;

    public $searchable = ['story_en', 'story_es'];

    protected $fillable = [
        'category_id', 'story_en', 'record_en', 'story_es', 'record_es', 'image', 'eg_link',
        'visible', 'sub_title_en', 'sub_title_es', 'description_en', 'description_es'
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }

    protected static function boot()
    {
        static::deleting(function ($model) {
            $model->deleteAudios();

            $model->getImagePath('stories', false, function ($image) {
                unlink($image);
            });

            $model->getImagePath('stories', true, function ($image) {
                unlink($image);
            });

            $studied = Studied::where(['type' => 'stories', 'id' => $model->id])->first();

            if ($studied) {
                $studied->delete();
            }
        });

        parent::boot(); // TODO: Change the autogenerated stub
    }
}
