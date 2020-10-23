<?php

namespace App\Models;

use App\ItemState;
use App\Studied;
use Illuminate\Database\Eloquent\Model;

class Word extends Model
{
    use \App\Http\Controllers\Traits\Image;

    protected $fillable = [
        'category_id', 'word_en', 'record_en', 'word_es', 'record_es', 'image', 'eg_link', 'visible'
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id')->with('parent');
    }

    protected static function boot()
    {
        static::deleting(function ($model) {
            $model->deleteAudios();

            $model->getImagePath('words', false, function ($image) {
                unlink($image);
            });

            $model->getImagePath('words', true, function ($image) {
                unlink($image);
            });

            $studied = Studied::where(['type' => 'words', 'id' => $model->id, 'user_id' => auth()->id()])->find();

            if ($studied) {
                $studied->delete();
            }

            $itemState = ItemState::where(['type' => 'words', 'id' => $model->id, 'user_id' => auth()->id()])->find();

            if ($itemState) {
                $itemState->delete();
            }
        });

        parent::boot(); // TODO: Change the autogenerated stub
    }
}
