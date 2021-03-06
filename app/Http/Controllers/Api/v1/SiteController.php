<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\Models\Faq;
use App\Models\Option;
use App\Models\User;
use App\Notifications\Notify;
use App\Services\Card;
use App\Services\Statistics;
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

        $query = $this->factory($request->type);

        if ($request->type == 'conversations') {
            $query = $query->with('users_conversations');
        };

        $model = $query->with('category')->findOrFail($id);

        $this->setAssetPath($model);

        if ($model->category) {
            $this->setAssetPath($model->category);

            if ($model->category->parent) {
                $this->setAssetPath($model->category->parent);
            }
        }

        $this->correctAttributes($model);

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

        $types = ['words', 'phrases', 'verbs'];
        //$types = ['words', 'phrases', 'verbs', 'stories', 'conversations', 'flashcards'];

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

            $result = array_merge($result, $query->get()->map($this->mapping())->toArray());
        }

        return $result;
    }

    public function statistics(Statistics $statistics)
    {
        $thisWeek = $statistics->getStatisticsByInterval(Statistics::INTERVAL_WEEK);
        $thisMonth = $statistics->getStatisticsByInterval(Statistics::INTERVAL_MONTH);
        $allTime = $statistics->getStatisticsByInterval(Statistics::INTERVAL_YEAR);

        return compact('allTime', 'thisWeek', 'thisMonth');
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

    public function cardCollection($limit)
    {
        $card = new Card(intval($limit));

        $allIds = $card->all()->pluck('id', 'id')->toArray();

        $result = [];

        foreach ($card->getItems() as $card_item) {
            if (in_array($card_item['id'], $allIds)) {
                continue;
            }

            $result[] = $card_item;
        }

        return $result;
    }

    public function addToCard(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'data' => 'required|array',
                'data.*.item_id' => 'required|numeric',
                'data.*.type' => 'required|string|max:20',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 401);
            }

            $card = new Card();
            $card->setItems($request->data);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Check the POST data params. ' . $e->getMessage(), 'POST' => $request->all()], 401);
        }

        return ['success' => true];
    }

    public function getCardItems()
    {
        $card = new Card();

        return $card->all(true);
    }
}
