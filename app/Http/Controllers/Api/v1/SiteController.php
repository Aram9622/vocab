<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Models\Faq;
use App\Models\Option;
use App\Models\User;
use App\Notifications\Notify;
use Illuminate\Http\Request;
use Validator;

class SiteController extends ApiController
{
    use Categories;

    public function general(Request $request)
    {
        $query = Faq::query();

        if (in_array($request->type, ['faq', 'terms-of-use', 'privacy-policy'])) {
            $query = $query->where('type', $request->type);
        }

        $extraPages = $query->get();

        $helpPage = Option::item('help');

        return compact('extraPages', 'helpPage');
    }

    public function categoryItem($id, Request $request)
    {
        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'exercises'];

        if (!in_array($request->type, $types)) {
            return ['error' => 'The type param mast be one of these items (words, phrases, verbs, stories, conversations, exercises)'];
        }

        $model = $this->factory($request->type)->with('category')->findOrFail($id);

        $this->setAssetPath($model);

        if ($model->category) {
            $this->setAssetPath($model->category);

            if ($model->category->parent) {
                $this->setAssetPath($model->category->parent);
            }
        }

        return $model;
    }

    public function search(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'search' => 'required|string|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'flashcards'];

        $result = [];

        foreach ($types as $type) {
            $model = $this->factory($type);
            $searchable = $model->searchable;

            if (empty($searchable) || !is_array($searchable)) {
                continue;
            }

            $query = $model->newQuery();

            if (in_array('user_id', $model->getFillable())) {
                $query = $model->where('user_id', auth()->id());
            }

            $query = $query->where($searchable[0], 'like', "%$request->search%");

            array_shift($searchable);

            foreach ($searchable as $item) {
                $query = $query->orWhere($item, 'like', "%$request->search%");
            }

            $result[$type] = $query->get()->map($this->mapping());
        }

        return $result;
    }

    public function mail(Request $request)
    {
        if (!$request->message) {
            return ['error' => 'the message field is required.'];
        }

        $user = User::where('id', 1)->firstOrFail();

        try {
            $success = true;
            $user->notify(new Notify($request->message));
        } catch (\Exception $e) {
            $success = false;
        }

        return ['success' => $success];
    }
}
