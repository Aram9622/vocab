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
                        <li><a href="">Conversations /&ensp;</a></li>
                        <li><a href="">{{ ucfirst($conversation->category->parent->level) }}</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <ul class="categ__menu">
                                    <li><a href="">Categories </a></li>
                                    <li><a href="{{ route('admin.new.conversations.index', [request()->segment(2), $conversation->category->parent->id]) }}">&ensp;/ {{ $conversation->category->parent->name }}</a></li>
                                    <li>&ensp;/ {{ $conversation->category->name }}</li>
                                </ul>
                                <h3>Edit conversation</h3>
                                <div class="Create_new_category">
                                    <form action="{{route('admin.new.conversations.update.item', $conversation->id)}}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div class="add__conversation_record">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div>
                                                                    <p>English conversation</p>
                                                                    <input style="max-width: 100%;" type="text" value="{{ $conversation->conversation_en }}" name="conversation_en">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="add__conversation_record">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div>
                                                                    <p>Spanish conversation</p>
                                                                    <input style="max-width: 100%;" type="text" value="{{ $conversation->conversation_es }}" name="conversation_es">
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
                                                        <div id="imagePreview" style='background-image: url("{{asset('uploads/conversations/'.$conversation->image)}}")'></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="categ_inputs">
                                                    <div class="link_input">
                                                        <p>Edit E.G. link</p>
                                                        <input type="text" value="{{ $conversation->eg_link }}" name="eg_link">
                                                    </div>
                                                    <div class="categ_btns">
                                                        <button class="cancel__btn">Cancel</button>
                                                        <button class="save__btn">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                            </div>
                                            <ul class="bg-danger error-content">
                                                @foreach ($errors->all() as $error)
                                                    <li class="text-white">{{ $error }}</li>
                                                @endforeach
                                            </ul>
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
