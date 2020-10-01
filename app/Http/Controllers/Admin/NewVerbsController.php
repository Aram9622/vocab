<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreVerbRequest;
use App\Http\Requests\UpdateVerbRequest;
use App\Http\Requests\StoreCategoryRequest;
use App\Models\Category;
use App\Models\Verb;
use File;

class NewVerbsController extends Controller
{
    public function index($level, Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => 'verbs', 'level' => $level, 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }

        return view('Admin.pages.new-verbs.index', compact('categories', 'category', 'sub_category'));
    }

    public function edit(Verb $verb)
    {
        return view('Admin.pages.new-verbs.edit-item', compact('verb'));
    }

    public function updateItem(UpdateVerbRequest $request, Verb $verb)
    {
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/verbs/' . $verb->image;
            $exisitingImageThumb = 'uploads/thumb/' . $verb->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'verbs';
            $request = $this->saveFiles($request, $image_path);
        }
        $data = $request->except('_token');
        if ($request->record_en) {
            $exisitingRecordEn = 'uploads/audio/' . $verb->record_en;
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
            $exisitingRecordEs = 'uploads/audio/' . $verb->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_es'] = $filename;
        }

        Verb::where('id', '=', $verb->id)->update($data);

        return redirect()->route('admin.new.verbs.add.item', [$verb->category->level, $verb->category->parent->id, $verb->category->id]);
    }

    public function createCategory($level, $parent_id = 0, StoreCategoryRequest $request)
    {
        $type = 'verbs';
        Category::createItem($type, $level, $parent_id, $request);
        return redirect()->back();
    }

    public function addItem($level, Category $category, Category $sub_category)
    {
        $verbs = Verb::where('category_id', '=', $sub_category->id)->paginate(50);
        return view('Admin.pages.new-verbs.add-item', compact('category', 'sub_category', 'verbs'));
    }

    public function storeItem(StoreVerbRequest $request, $category_id)
    {
        if ($request->hasFile('image')) {
            $image_path = 'verbs';
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
        Verb::create($data);
        return redirect()->back();
    }

    public function deleteItem(Verb $verb)
    {
        $exisitingImage = 'uploads/verbs/' . $verb->image;
        $exisitingImageThumb = 'uploads/thumb/' . $verb->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/' . $verb->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/' . $verb->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $verb->delete();
        return redirect()->back();
    }

    public function visibility(Request $request)
    {
        Verb::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
