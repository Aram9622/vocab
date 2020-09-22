<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreStoryRequest;
use App\Http\Requests\UpdateStoryRequest;
use App\Http\Requests\StoreCategoryRequest;
use App\Models\Category;
use App\Models\Story;
use File;

class StoriesController extends Controller
{
    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => 'stories', 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }
        return view('Admin.pages.new-stories.index', compact('categories', 'category', 'sub_category'));
    }

    public function createCategory($level, $parent_id = 0, StoreCategoryRequest $request)
    {
        $type = 'stories';
        Category::createItem($type, $level, $parent_id, $request);
        return redirect()->back();
    }

    public function edit(Story $story)
    {
        return view('Admin.pages.new-stories.edit-item', compact('story'));
    }

    public function updateItem(UpdateStoryRequest $request, Story $story)
    {
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/stories/' . $story->image;
            $exisitingImageThumb = 'uploads/thumb/' . $story->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'stories';
            $request = $this->saveFiles($request, $image_path);
        }
        $data = $request->except('_token');
        if ($request->record_en) {
            $exisitingRecordEn = 'uploads/audio/' . $story->record_en;
            if (File::exists(public_path($exisitingRecordEn))) {
                File::delete(public_path($exisitingRecordEn));
            }

            $music_file = $request->record_en;
            $filename = time() . 'en-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_en'] = $filename;
        }
        if ($request->record_es) {
            $exisitingRecordEs = 'uploads/audio/' . $story->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_es'] = $filename;
        }

        Story::where('id', '=', $story->id)->update($data);

        return redirect()->route('admin.new.stories.add.item', [$story->category->level, $story->category->parent->id, $story->category->id]);
    }

    public function addItem($level, Category $category, Category $sub_category)
    {
        $stories = Story::where('category_id', '=', $sub_category->id)->paginate(50);
        return view('Admin.pages.new-stories.add-item', compact('category', 'sub_category', 'stories'));
    }

    public function storeItem(StoreStoryRequest $request, $category_id)
    {
        if ($request->hasFile('image')) {
            $image_path = 'stories';
            $request = $this->saveFiles($request, $image_path);
        }
        $data = $request->all();
        $data['category_id'] = $category_id;

        if ($request->record_en) {
            $music_file = $request->record_en;
            $filename = time() . 'en-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_en'] = $filename;
        }
        if ($request->record_es) {
            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_es'] = $filename;
        }
        Story::create($data);
        return redirect()->back();
    }

    public function deleteItem(Story $story)
    {
        $exisitingImage = 'uploads/stories/' . $story->image;
        $exisitingImageThumb = 'uploads/thumb/' . $story->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/' . $story->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/' . $story->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $story->delete();
        return redirect()->back();
    }

    public function visibility(Request $request)
    {
        Story::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
