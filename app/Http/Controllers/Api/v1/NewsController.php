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
            return $this->item($model);
        });
    }

    public function view($id)
    {
        return $this->item($this->model->findOrFail($id));
    }

    public function item(News $model)
    {
        $model->showAssetPath = true;
        $model->image_thumb = $model->getImagePath('thumb');
        $model->image = $model->getImagePath('news');

        return $model;
    }
}
