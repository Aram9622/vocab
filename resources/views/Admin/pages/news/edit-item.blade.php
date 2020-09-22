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
                        <li><a href="">News</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <h3>Edit news</h3>
                                <div class="Create_new_category">
                                    <form method="POST" enctype="multipart/form-data" action="{{route('admin.news.update.item', $news->id)}}">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="upload__image_box">
                                                    <p>Add picture (max 1mb)</p>
                                                    <div class="upload__image">
                                                        <div id="imagePreview" style='background-image: url("{{asset('uploads/news/'.$news->image)}}")'></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="categ_inputs">
                                                    <div class="news_input">
                                                        <p>Title</p>
                                                        <input type="text" value="{{ $news->title }}" name="title">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7"></div>
                                        </div>
                                        <div class="Newstextarea-row">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <div class="categ_inputs">
                                                        <div class="news_textarea">
                                                            <p>News</p>
                                                            <textarea placeholder="Write here" name="description">{{ $news->description }}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="categ_inputs">
                                                        <div class="categ_btns">
                                                            <button class="cancel__btn">Cancel</button>
                                                            <button class="save__btn">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <ul class="bg-danger error-content">
                                        @foreach ($errors->all() as $error)
                                            <li class="text-white">{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection