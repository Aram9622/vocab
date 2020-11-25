@extends('layouts.master')
@section('content')
    <main class="main-content">
        <div class="nav-btn pull-left">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="dashboard_content">
            <div class="container-fluid">
                <div class="content_topMenu">
                    <ul>
                        <li><a href="">Stories /&ensp;</a></li>
                        <li><a href="">{{ ucfirst($story->category->parent->level) }}</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <ul class="categ__menu">
                                    <li><a href="">Categories </a></li>
                                    <li><a href="{{ route('admin.new.stories.index', [request()->segment(2), $story->category->parent->id]) }}">&ensp;/ {{ $story->category->parent->name }}</a></li>
                                    <li>&ensp;/ {{ $story->category->name }}</li>
                                </ul>
                                <h3>Edit story</h3>
                                <div class="Create_new_category">
                                    <form action="{{route('admin.new.stories.update.item', $story->id)}}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div class="add__story_record">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>English story</p>
                                                                    <input type="text" value="{{ $story->story_en }}" name="story_en">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Edit English record</p>
                                                                    <div class="upload__record">
                                                                        <div class="input-group btn-upload">
                                                                           <span class="input-group-btn">
                                                                              <div class="btn btn-upload-input">
                                                                                  <span class="btn-upload-input-title">Upload record</span>
                                                                                  <input type="file" name="record_en"/>
                                                                               </div>
                                                                           </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="add__story_record">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Spanish story</p>
                                                                    <input type="text" value="{{ $story->story_es }}" name="story_es">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Edit Spanish record</p>
                                                                    <div class="upload__record">
                                                                        <div class="input-group btn-upload">
                                                                           <span class="input-group-btn">
                                                                              <div class="btn btn-upload-input2">
                                                                                  <span class="btn-upload-input-title2">Upload record</span>
                                                                                  <input type="file" name="record_es"/>
                                                                               </div>
                                                                           </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="upload__image_box">
                                                    <p>Edit picture (max 1mb)</p>
                                                    <div class="upload__image">
                                                        <div id="imagePreview" style='background-image: url("{{asset('uploads/stories/'.$story->image)}}")'></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="categ_inputs">
                                                    <div class="link_input">
                                                        <p>Edit E.G. link</p>
                                                        <input type="text" value="{{ $story->eg_link }}" name="eg_link">
                                                    </div>
                                                    <div class="categ_btns">
                                                        <button class="cancel__btn">Cancel</button>
                                                        <button class="save__btn">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <p>English Sub Title</p>
                                                    <input value="{{ $story->sub_title_en }}" name="sub_title_en" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <p>English Description</p>
                                                    <textarea rows="5" name="description_en" class="form-control">{{ $story->description_en }}</textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <p>Spanish Sub Title</p>
                                                    <input value="{{ $story->sub_title_es }}" name="sub_title_es" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <p>Spanish Description</p>
                                                    <textarea rows="5" name="description_es" class="form-control">{{ $story->description_es }}</textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="categ_btns">
                                            <button class="cancel__btn">Cancel</button>
                                            <button class="save__btn">Save</button>
                                        </div>
                                     </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
