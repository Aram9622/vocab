<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Http\Controllers\Controller;
use App\Studied;
use Illuminate\Http\Request;

class StudiedController extends Controller
{
    use Categories;

    protected $model;

    public function __construct(Studied $model)
    {
        $this->model = $model;
    }

    public function get(Request $request)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        return $this->model->where('type', $request->type)->get();
    }

    public function view(Request $request, $id)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        return $this->model->where('id', $id)->where('type', $request->type)->first();
    }

    public function store(Request $request)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        $studiedModel = $this->factory($request->type)->where('id', $request->studied_id)->first();

        if (!$studiedModel) {
            return ['error' => 'No data found by this id'];
        }

        ($model = $this->model)->fill($request->all())->save();

        return $model;
    }
}
