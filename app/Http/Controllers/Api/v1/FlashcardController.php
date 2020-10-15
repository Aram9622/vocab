<?php

namespace App\Http\Controllers\Api\v1;

use App\FlashcardGroup;
use Illuminate\Http\Request;
use Validator;

class FlashcardController extends ApiController
{
    protected $model;

    public function __construct(FlashcardGroup $model)
    {
        $this->model = $model;
    }

    public function groups()
    {
        return $this->model->with('parent')->all();
    }

    public function groupView($id)
    {
        return $this->model->with('parent')->find($id);
    }

    public function groupStore(Request $request, $id = null)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|min:2',
            'parent_id' => 'nullable|exists:flashcard_groups,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $model = $this->model->with('parent')->find($id) ?: $this->model;

        $model->fill($request->all())->save();

        return $model;
    }

    public function groupDelete($id)
    {
        $success = $this->model->with('parent')->findOrFail($id)->delete();

        return compact('success');
    }
}
