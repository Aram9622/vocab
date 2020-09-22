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
                        <li><a href="">New Words /&ensp;</a></li>
                        <li><a href="">{{ ucfirst(request()->segment(2)) }}</a></li>
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
                                    <form method="POST" action="{{route('admin.new.words.create.category', [request()->segment(2), $category])}}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="upload__image_box">
                                                    <p>Add picture (max 1mb)</p>
                                                    <div class="upload__image">
                                                        <div id="imagePreview"></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div>
                                                        <p>Category name</p>
                                                        <input type="text" name="name" placeholder="Category Name">
                                                    </div>
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
                                            <a href="{{ isset($category) ? route('admin.new.words.add.item', [request()->segment(2), $category->id, $cat->id]) 
                                              : route('admin.new.words.index', [request()->segment(2), $cat->id]) }}">
                                                <img src="{{asset('uploads/categories/words/'.request()->segment(2).'/'.$cat->image )}}">
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