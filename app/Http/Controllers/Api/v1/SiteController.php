<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Api\v1\Traits\Categories;
use App\ItemState;
use App\Models\Faq;
use App\Models\Option;
use App\Models\User;
use App\Notifications\Notify;
use App\Services\Card;
use Carbon\Carbon;
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

    public function getStatisticsByInterval($interval = 0)
    {
        $types = ['words', 'phrases', 'verbs'];

        $count = 0;
        foreach ($types as $type) {
            $count += $this->factory($type)->count();
        }

        if ($interval) {
            $date = Carbon::now()->addDays("-$interval")->toDateString();

            if ($interval == 7) {
                $date = Carbon::now()->startOfWeek()->toDateString();
            } elseif ($interval == 30) {
                $date = Carbon::now()->startOfMonth()->toDateString();
            } elseif ($interval == 365) {
                $date = Carbon::now()->startOfYear()->toDateString();
            }

            $query = ItemState::where('user_id', 7)
                ->selectRaw('type, DATE(updated_at) as date, COUNT(DATE(updated_at)) as count')
                ->where('current_state', 'learned')
                ->whereBetween('updated_at', [
                    $date, Carbon::now()->toDateString()
                ])
                ->groupBy('DATE(updated_at)');
        } else {
            $query = ItemState::selectRaw('type, DATE(updated_at) as date, COUNT(DATE(updated_at)) as count')
                ->where('user_id', 7)
                ->where('current_state', 'learned')
                ->groupBy('DATE(updated_at)');
        }

        $learned = $query->get();

        $learnedCount = $query->count();

        return ['allTimeCount' => $count, 'learnedCount' => $learnedCount, 'learned' => $learned];
    }

    public function statistics()
    {
        $thisWeek = $this->getStatisticsByInterval(7);
        $thisMonth = $this->getStatisticsByInterval(30);
        $allTime = $this->getStatisticsByInterval(365);

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
