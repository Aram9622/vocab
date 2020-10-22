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
        return $this->flashcard->with('group')->get()->map($this->mapping());
    }

    public function view($id)
    {
        $model = $this->flashcard->with('group')->find($id);

        return $this->mapping($model);
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

        return $this->mapping($model);
    }

    public function delete($id)
    {
        $success = $this->flashcard->findOrFail($id)->delete();

        return compact('success');
    }

    public function groups()
    {
        return $this->flashcardGroup->with('subs', 'parent')->get()->map($this->mapping());
    }

    public function groupView($id)
    {
        $model = $this->flashcardGroup->with('subs', 'parent')->find($id);

        return $this->mapping($model);
    }

    public function groupStore(Request $request, $id = null)
    {
        $validType = $id ? 'required' : 'nullable';

        die($validType);

        $data = $request->all();

        $validator = Validator::make($data, [
            'name' => "$validType|string|min:2",
            'parent_id' => 'nullable|exists:flashcard_groups,id',
            'image' => "$validType|image",
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $model = $this->flashcardGroup->with('subs', 'parent')->find($id) ?: $this->flashcardGroup;

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

        return $this->mapping($model);
    }

    public function groupDelete($id)
    {
        $success = $this->flashcardGroup->findOrFail($id)->delete();

        return compact('success');
    }

    public function mapping($_model = null)
    {
        $map = function ($model) {
            $model->image = $model->image ? asset('flashcard/' . $model->image) : null;

            return $model;
        };

        if ($_model) {
            return  $map($_model);
        }

        return $map;
    }
}
