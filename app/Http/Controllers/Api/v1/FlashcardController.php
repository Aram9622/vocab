<?php

namespace App\Http\Controllers\Api\v1;

use App\Flashcard;
use App\FlashcardGroup;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Validator;

class FlashcardController extends ApiController
{
    protected $flashcard;
    protected $flashcardGroup;

    public function __construct(Flashcard $flashcard, FlashcardGroup $flashcardGroup)
    {
        $this->flashcard = $flashcard;
        $this->flashcardGroup = $flashcardGroup;
    }

    public function index()
    {
        return $this->flashcard->with('group')->get();
    }

    public function view($id)
    {
        return $this->flashcard->with('group')->find($id);
    }

    public function store(Request $request, $id = null)
    {
        $data = $request->all();

        $validType = $id ? 'required' : 'nullable';

        $validator = Validator::make($data, [
            'word_en' => "$validType|string|min:2",
            'word_es' => "$validType|string|min:2",
            'group_id' => "$validType|exists:flashcard_groups,id",
            'image' => "$validType|image",
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $model = $this->flashcard->with('group')->find($id) ?: $this->flashcardGroup;

        if ($request->hasFile('image')) {
            if (is_file($img = public_path('flashcard/' . $model->image))) {
                unlink($img);
            }

            $file = $request->file('image');
            $name = uniqid() . '.' . strtolower($file->getClientOriginalExtension());
            $url = 'flashcard/' . $name;

            Image::make($file)
                ->resize(400, 400)
                ->save(public_path($url));

            $model->image = $data['image'] = $name;
        }

        $model->fill($data)->save();

        return $model;
    }

    public function delete(Request $request, $id = null)
    {
        $success = $this->flashcardGroup->with('group')->findOrFail($id)->delete();

        return compact('success');
    }

    public function groups()
    {
        return $this->flashcardGroup->with('subs', 'parent')->get();
    }

    public function groupView($id)
    {
        return $this->flashcardGroup->with('subs', 'parent')->find($id);
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

        $model = $this->flashcardGroup->with('subs', 'parent')->find($id) ?: $this->flashcardGroup;

        $model->fill($request->all())->save();

        return $model;
    }

    public function groupDelete($id)
    {
        $success = $this->flashcardGroup->with('subs', 'parent')->findOrFail($id)->delete();

        return compact('success');
    }
}
