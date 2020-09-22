<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StorePhraseRequest;
use App\Http\Requests\UpdatePhraseRequest;
use App\Http\Controllers\Traits\FileUploadTrait;
use App\Http\Requests\StoreCategoryRequest;
use App\Models\Category;
use App\Models\Phrase;
use File;

class NewPhrasesController extends Controller
{
    public function index($level, Category $category = null, Category $sub_category = null){
    	if (!$category) {
    		$categories = Category::where(['type'=>'phrases', 'level' => $level, 'parent_id' => null])->get();
    	}else {
    		$categories = Category::where('parent_id', '=', $category->id)->get();
    	}
    	
    	return view('Admin.pages.new-phrases.index', compact('categories', 'category', 'sub_category'));
    }

    public function edit(Phrase $phrase){
        return view('Admin.pages.new-phrases.edit-item', compact('phrase'));
    }

    public function updateItem(UpdatePhraseRequest $request, Phrase $phrase){
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/phrases/'.$phrase->image;
            $exisitingImageThumb = 'uploads/thumb/'.$phrase->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'phrases';
            $request    = $this->saveFiles($request, $image_path);
        }
        $data                = $request->except('_token');
        if ( $request->record_en ) {
            $exisitingRecordEn = 'uploads/audio/'.$phrase->record_en;
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
            $exisitingRecordEs = 'uploads/audio/'.$phrase->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_es'] = $filename;
        }
        
        Phrase::where('id', '=', $phrase->id)->update($data);

        return redirect()->route('admin.new.phrases.add.item', [$phrase->category->level, $phrase->category->parent->id, $phrase->category->id]);
    }

    public function createCategory($level, $parent_id = 0, StoreCategoryRequest $request){
    	$type = 'phrases';
    	Category::createItem($type, $level, $parent_id, $request);
    	return redirect()->back();
    }

    public function addItem($level, Category $category, Category $sub_category) {
        $phrases = Phrase::where('category_id', '=', $sub_category->id)->paginate(50);
    	return view('Admin.pages.new-phrases.add-item', compact('category', 'sub_category', 'phrases'));
    }

    public function storeItem(StorePhraseRequest $request, $category_id) {
        if ($request->hasFile('image')) {
            $image_path = 'phrases';
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
        Phrase::create($data);
        return redirect()->back();
    }

    public function deleteItem(Phrase $phrase){
        $exisitingImage = 'uploads/phrases/'.$phrase->image;
        $exisitingImageThumb = 'uploads/thumb/'.$phrase->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/'.$phrase->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/'.$phrase->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $phrase->delete();
        return redirect()->back();
    }

    public function visibility(Request $request){
        Phrase::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
