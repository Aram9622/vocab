<?php

namespace App\Http\Controllers\Api\v1;

use App\Flashcard;
use Illuminate\Http\Request;

class FlashcardController extends ApiController
{
    protected $model;

    public function __construct(Flashcard $model)
    {
        $this->model = $model;
    }

    public function groups()
    {
        return $this->model->all();
    }

    public function groupView($id)
    {
        return $this->model->find($id);
    }

    public function groupStore(Request $request, $id = null)
    {
        $model = $this->model->find($id) ?: $this->model;

        $model->fill($request->all())->save();

        return $model;
    }

    public function groupDelete($id)
    {
        $success = $this->model->findOrFail($id)->delete();

        return compact('success');
    }
}
