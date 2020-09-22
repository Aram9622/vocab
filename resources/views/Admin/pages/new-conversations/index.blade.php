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
                        <li><a href="">Reading and Listening</a></li>
                        <li><a href="">&ensp;/ Conversations</a></li>
                        <li><a href="">&ensp;/ {{ ucfirst(request()->segment(3)) }}</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <ul class="categ__menu">
                                    <li><a href="">Categories</a></li>
                                    @if($category)
                                        <li>&ensp;/ {{ ucfirst($category->name) }}</li>
                                    @endif
                                </ul>
                                <h3>Create new {{!$category ? 'category' : 'Subcategory'}}</h3>
                                <div class="Create_new_category">
                                    <form method="POST" action="{{route('admin.new.conversations.create.category', [request()->segment(3), $category])}}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="upload__image_box">
                                                    <p>Add picture (max 1mb)</p>
                                                    <div class="upload__image">
                                                        <div id="imagePreview"></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                    @if($errors->has('image'))
                                                        <em class="invalid-feedback">
                                                            {{ $errors->first('image') }}
                                                        </em>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div>
                                                        <p>Category name</p>
                                                        <input type="text" name="name" placeholder="Category Name">
                                                    </div>
                                                    @if($errors->has('name'))
                                                        <em class="invalid-feedback">
                                                            {{ $errors->first('name') }}
                                                        </em>
                                                    @endif
                                                    <div>
                                                        <div class="categ_btns">
                                                            <button class="cancel__btn">Cancel</button>
                                                            <button class="save__btn">Save</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-5"></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="categories_sect">
                                <h3>All {{!$category ? 'Categories' : 'Subcategories'}}</h3>
                                <div class="categories_box">
                                    @foreach($categories as $cat)
                                        <div class="categ_item">
                                            <a href="{{ isset($category) ? route('admin.new.conversations.add.item', [request()->segment(3), $category->id, $cat->id]) 
                                              : route('admin.new.conversations.index', [request()->segment(3), $cat->id]) }}">
                                                <img src="{{asset('uploads/categories/conversations/'.request()->segment(3).'/'.$cat->image )}}">
                                                <h2>{{$cat->name}}</h2>
                                            </a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection