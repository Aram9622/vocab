<?php

namespace App\Http\Controllers\Api\v1;

use App\Models\News;
use App\UserNotification;
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

    public function index(UserNotification $userNotification)
    {
        $news = $this->model->all();

        $userNotification = $this->getUserNotification($userNotification);
        $userNotification->type = 'news';
        $userNotification->user_id = auth()->id();
        $userNotification->views_count = $news->count();
        $userNotification->save();

        return $news->map(function ($model) {
            return $this->item($model);
        });
    }

    public function notification(UserNotification $userNotification)
    {
        $userNotification = $this->getUserNotification($userNotification);

        $allNewsCount = $this->model->all()->count();
        $readNewsCount = $userNotification->views_count;
        $unreadNewsCount = $allNewsCount - $readNewsCount;

        return [
            'all_news_count' => $allNewsCount,
            'read_news_count' => $readNewsCount,
            'unread_news_count' => $unreadNewsCount,
        ];
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

    public function getUserNotification(UserNotification $userNotification)
    {
        return $userNotification->where('user_id', auth()->id())->where('type', 'news')->first() ?: $userNotification;
    }
}
