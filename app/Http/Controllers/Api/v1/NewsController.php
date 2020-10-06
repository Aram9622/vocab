<?php

namespace App\Http\Controllers\Api\v1;

use App\Models\News;
use Illuminate\Http\Request;

class NewsController extends ApiController
{
    /**
     * @var News $model
     */
    protected $model;

    public function __construct(News $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        return $this->model->all()->map(function ($model) {
            $model->showAssetPath = true;
            $model->image_thumb = $model->getImagePath('thumb');
            $model->image = $model->getImagePath('news');
            return $model;
        });
    }
}
