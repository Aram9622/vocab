<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Studied;
use Illuminate\Http\Request;

class StudiedController extends ApiController
{
    use Categories;

    protected $model;

    protected $type;

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

        $model = $this->model->where(['type' => $request->type, 'studied_id' => $request->studied_id])->first() ?: $this->model;

        if ($request->percent == 100) {
            $request->state = 'learned';
            $response = $this->stateChange($request->type, $request->studied_id, $request);

            if (empty($response['error']) && $model->id) {
                $model->delete();
            }

            return $response;
        } else {
//            TODO if the percent is not equal to 100 then it should ......
//            $request->state = 'default';
//            $this->stateChange($request->type, $request->studied_id, $request);
        }

        $studiedModel = $this->factory($request->type)->where('id', $request->studied_id)->first();

        if (!$studiedModel) {
            return ['error' => 'No data found by this id'];
        }

        $model->fill($request->all())->save();

        return $model;
    }
}
