<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\StoreConversationRequest;
use App\Http\Requests\UpdateConversationRequest;
use App\Http\Controllers\Traits\FileUploadTrait;
use App\Http\Requests\StoreCategoryRequest;
use App\Models\Category;
use App\Models\Conversation;
use File;

class ConversationsController extends Controller
{
    public function index($level, Category $category = null, Category $sub_category = null){
    	if (!$category) {
    		$categories = Category::where(['type'=>'conversations', 'level' => $level, 'parent_id' => null])->get();
    	}else {
    		$categories = Category::where('parent_id', '=', $category->id)->get();
    	}
    	
    	return view('Admin.pages.new-conversations.index', compact('categories', 'category', 'sub_category'));
    }

    public function edit(Conversation $conversation){
        return view('Admin.pages.new-conversations.edit-item', compact('conversation'));
    }

    public function updateItem(UpdateConversationRequest $request, Conversation $conversation){
        if ($request->hasFile('image')) {
            $exisitingImage = 'uploads/conversations/'.$conversation->image;
            $exisitingImageThumb = 'uploads/thumb/'.$conversation->image;
            if (File::exists(public_path($exisitingImage))) {
                File::delete(public_path($exisitingImage));
                File::delete(public_path($exisitingImageThumb));
            }
            $image_path = 'conversations';
            $request    = $this->saveFiles($request, $image_path);
        }
        $data                = $request->except('_token');
        if ( $request->record_en ) {
            $exisitingRecordEn = 'uploads/audio/'.$conversation->record_en;
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
            $exisitingRecordEs = 'uploads/audio/'.$conversation->record_es;
            if (File::exists(public_path($exisitingRecordEs))) {
                File::delete(public_path($exisitingRecordEs));
            }

            $music_file = $request->record_es;
            $filename = time() . 'es-' . $music_file->getClientOriginalName();
            $location = public_path('uploads/audio');
            $music_file->move($location,$filename);
            $data['record_es'] = $filename;
        }
        
        Conversation::where('id', '=', $conversation->id)->update($data);

        return redirect()->route('admin.new.conversations.add.item', [$conversation->category->level, $conversation->category->parent->id, $conversation->category->id]);
    }

    public function createCategory($level, $parent_id = 0, StoreCategoryRequest $request){
    	$type = 'conversations';
    	Category::createItem($type, $level, $parent_id, $request);
    	return redirect()->back();
    }

    public function addItem($level,Category $category, Category $sub_category) {
        $conversations = Conversation::where('category_id', '=', $sub_category->id)->paginate(50);
    	return view('Admin.pages.new-conversations.add-item', compact('category', 'sub_category', 'conversations'));
    }

    public function storeItem(StoreConversationRequest $request, $category_id) {
        if ($request->hasFile('image')) {
            $image_path = 'conversations';
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
        Conversation::create($data);
        return redirect()->back();
    }

    public function deleteItem(Conversation $conversation){
        $exisitingImage = 'uploads/conversations/'.$conversation->image;
        $exisitingImageThumb = 'uploads/thumb/'.$conversation->image;
        if (File::exists(public_path($exisitingImage))) {
            File::delete(public_path($exisitingImage));
            File::delete(public_path($exisitingImageThumb));
        }
        $exisitingRecordEn = 'uploads/audio/'.$conversation->record_en;
        if (File::exists(public_path($exisitingRecordEn))) {
            File::delete(public_path($exisitingRecordEn));
        }
        $exisitingRecordEs = 'uploads/audio/'.$conversation->record_es;
        if (File::exists(public_path($exisitingRecordEs))) {
            File::delete(public_path($exisitingRecordEs));
        }
        $conversation->delete();
        return redirect()->back();
    }

    public function visibility(Request $request){
        Conversation::where('id', '=', $request->item)->update(['visible' => $request->visible]);
        return response()->json(['error' => false]);
    }
}
