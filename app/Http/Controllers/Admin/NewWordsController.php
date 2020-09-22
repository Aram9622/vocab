<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreWordRequest;
use App\Http\Requests\UpdateWordRequest;
use App\Http\Requests\StoreCategoryRequest;
use App\Http\Controllers\Traits\FileUploadTrait;
use App\Models\Category;
use App\Models\Word;
use File;

class NewWordsController extends Controller
{
    public function index($level, Category $category = null, Category $sub_category = null){
    	if (!$category) {
    		$categories = Category::where(['type'=>'words', 'level' => $level, 'parent_id' => null])->get();
    	}else {
    		$categories = Category::where('parent_id', '=', $category->id)->get();
    	}
    	
    	return view('Admin.pages.new-words.index', compact('categories', 'category', 'sub_category'));
    }

    public function edit(Word $word){
        return view('Admin.pages.new-words.edit-item', compact('word'));
    }

    public function updateItem(UpdateWordRequest $request, Word $word){
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/words/'.$word->image;
            $exisitingImageThumb = 'uploads/thumb/'.$word->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'words';
            $request    = $this->saveFiles($request, $image_path);
        }
        $data                = $request->except('_token');
        if ( $request->record_en ) {
            $exisitingRecordEn = 'uploads/audio/'.$word->record_en;
            if (File::exists(public_path($exisitingRecordEn))) {
                File::delete(public_path($exisitingRecordEn));
            }

            $music_file = $request->record_en;
            $filename = time() . 'en-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_en'] = $filename;
        }
        if ( $request->record_es ) {
            $exisitingRecordEs = 'uploads/audio/'.$word->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_es'] = $filename;
        }
        
        Word::where('id', '=', $word->id)->update($data);

        return redirect()->route('admin.new.words.add.item', [$word->category->level, $word->category->parent->id, $word->category->id]);
    }

    public function createCategory($level, $parent_id = 0, StoreCategoryRequest $request){
    	$type = 'words';
    	Category::createItem($type, $level, $parent_id, $request);
    	return redirect()->back();
    }

    public function addItem($level,Category $category, Category $sub_category) {
        $words = Word::where('category_id', '=', $sub_category->id)->paginate(50);
    	return view('Admin.pages.new-words.add-item', compact('category', 'sub_category', 'words'));
    }

    public function storeItem(StoreWordRequest $request, $category_id) {
        if ($request->hasFile('image')) {
            $image_path = 'words';
            $request    = $this->saveFiles($request, $image_path);
        }
        $data                = $request->all();
        $data['category_id'] = $category_id;

        if ( $request->record_en ) {
            $music_file = $request->record_en;
            $filename = time() . 'en-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_en'] = $filename;
        }
        if ( $request->record_es ) {
            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_es'] = $filename;
        }
        Word::create($data);
        return redirect()->back();
    }

    public function deleteItem(Word $word){
        $exisitingImage = 'uploads/words/'.$word->image;
        $exisitingImageThumb = 'uploads/thumb/'.$word->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/'.$word->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/'.$word->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $word->delete();
        return redirect()->back();
    }

    public function visibility(Request $request){
        Word::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
