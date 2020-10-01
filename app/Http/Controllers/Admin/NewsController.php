<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreNewsRequest;
use App\Http\Requests\UpdateNewsRequest;
use App\Models\News;
use File;

class NewsController extends Controller
{
    public function index()
    {
        $news = News::orderByDesc('id')->paginate(50);
        return view('Admin.pages.news.index', compact('news'));
    }

    public function edit(News $news)
    {
        return view('Admin.pages.news.edit-item', compact('news'));
    }

    public function updateItem(UpdateNewsRequest $request, News $news)
    {
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/news/' . $news->image;
            $exisitingImageThumb = 'uploads/thumb/' . $news->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'news';
            $request = $this->saveFiles($request, $image_path);
        }
        $data = $request->except('_token');

        News::where('id', '=', $news->id)->update($data);

        return redirect()->route('admin.news.index');
    }

    public function store(StoreNewsRequest $request)
    {
        if ($request->hasFile('image')) {
            $image_path = 'news';
            $request = $this->saveFiles($request, $image_path);
        }
        News::create($request->all());
        return redirect()->back();
    }

    public function delete(News $news)
    {
        $news->delete();
        return redirect()->back();
    }

    public function visibility(Request $request)
    {
        News::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
