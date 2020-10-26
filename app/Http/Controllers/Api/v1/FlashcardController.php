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
        return $this->flashcard->with('group')->where('user_id', auth()->id())->get()->map($this->mapping());
    }

    public function view($id)
    {
        $model = $this->flashcard->with('group')->where('id', $id)->where('user_id', auth()->id())->firstOrFail();

        return $this->mapping($model);
    }


    public function viewByGroup($id)
    {
        $data = $this->flashcard->with('group')->where('group_id', $id)->where('user_id', auth()->id())->get()->map($this->mapping());

        return $data;
    }

    public function store(Request $request, $id = null)
    {
        $data = $request->all();

        $validType = is_null($id) ? 'required' : 'nullable';

        $validator = Validator::make($data, [
            'word_en' => "$validType|string|min:2",
            'word_es' => "$validType|string|min:2",
            'group_id' => "$validType|exists:flashcard_groups,id",
            'image' => "$validType|image",
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $model = $this->flashcard->with('group')->find($id) ?: $this->flashcard;

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

        $data['user_id'] = auth()->id();

        $model->fill($data)->save();

        return $this->mapping($model);
    }

    public function delete($id)
    {
        $success = $this->flashcard->where('id', $id)->where('user_id', auth()->id())->firstOrFail()->delete();

        return compact('success');
    }

    public function groups()
    {
        return $this->flashcardGroup->with('subs', 'parent')->where('user_id', auth()->id())->whereNull('parent_id')->get()->map($this->mapping());
    }

    public function groupView($id)
    {
        $model = $this->flashcardGroup->with('subs', 'parent')->where('id', $id)->where('user_id', auth()->id())->firstOrFail();

        return $this->mapping($model);
    }

    public function groupStore(Request $request, $id = null)
    {
        $validType = is_null($id) ? 'required' : 'nullable';

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

        $data['user_id'] = auth()->id();

        $model->fill($data)->save();

        return $this->mapping($model);
    }

    public function groupDelete($id)
    {
        $success = $this->flashcardGroup->where('id', $id)->where('user_id', auth()->id())->firstOrFail()->delete();

        return compact('success');
    }

    public function mapping($_model = null)
    {
        $map = function ($model) {
            $model->image = $model->image ? asset('flashcard/' . $model->image) : null;

            if (empty($model->image_thumb)) {
                $model->image_thumb = $model->image;
            }

            if ($model->subs) {
                $model->subs->map($this->mapping());
            }

            return $model;
        };

        if ($_model) {
            return $map($_model);
        }

        return $map;
    }
}
