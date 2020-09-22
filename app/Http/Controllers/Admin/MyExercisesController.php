<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreExerciseRequest;
use App\Http\Requests\UpdateExerciseRequest;
use App\Http\Requests\StoreCategoryRequest;
use App\Models\Category;
use App\Models\Exercise;
use File;

class MyExercisesController extends Controller
{
    public function index(Category $category = null, Category $sub_category = null)
    {
        if (!$category) {
            $categories = Category::where(['type' => 'exercises', 'parent_id' => null])->get();
        } else {
            $categories = Category::where('parent_id', '=', $category->id)->get();
        }

        return view('Admin.pages.exercises.index', compact('categories', 'category', 'sub_category'));
    }

    public function edit(Exercise $exercise)
    {
        return view('Admin.pages.exercises.edit-item', compact('exercise'));
    }

    public function updateItem(UpdateExerciseRequest $request, Exercise $exercise)
    {
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/exercises/' . $exercise->image;
            $exisitingImageThumb = 'uploads/thumb/' . $exercise->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'exercises';
            $request = $this->saveFiles($request, $image_path);
        }
        $data = $request->except('_token');
        if ($request->record_en) {
            $exisitingRecordEn = 'uploads/audio/' . $exercise->record_en;
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
            $exisitingRecordEs = 'uploads/audio/' . $exercise->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location, $filename);
            $data['record_es'] = $filename;
        }

        Exercise::where('id', '=', $exercise->id)->update($data);

        return redirect()->route('admin.new.exercises.add.item', [$exercise->category->level, $exercise->category->parent->id, $exercise->category->id]);
    }

    public function createCategory($parent_id = 0, StoreCategoryRequest $request)
    {
        $level = null;
        $type = 'exercises';
        Category::createItem($type, $level, $parent_id, $request);
        return redirect()->back();
    }

    public function addItem(Category $category, Category $sub_category)
    {
        //$exercises = Exercise::where('category_id', '=', $sub_category->id)->paginate(50);
        $exercises = [];
        return view('Admin.pages.exercises.add-item', compact('category', 'sub_category', 'exercises'));
    }

    public function storeItem(StoreExerciseRequest $request, $category_id)
    {
        if ($request->hasFile('image')) {
            $image_path = 'exercises';
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
        Exercise::create($data);
        return redirect()->back();
    }

    public function deleteItem(Exercise $exercise)
    {
        $exisitingImage = 'uploads/exercises/' . $exercise->image;
        $exisitingImageThumb = 'uploads/thumb/' . $exercise->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/' . $exercise->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/' . $exercise->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $exercise->delete();
        return redirect()->back();
    }

    public function visibility(Request $request)
    {
        Exercise::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
