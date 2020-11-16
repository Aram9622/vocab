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
                                    <li><a href="">Categories </a></li>
                                    <li>
                                        <a href="{{ route('admin.new.conversations.index', [$conversation->category->level, $conversation->category->parent->id]) }}">&ensp;/ {{ $conversation->category->parent->name }}</a>
                                    </li>
                                    <li>
                                        <a id="referer-url" href="{{ route('admin.new.conversations.add.item', [$conversation->category->level, $conversation->category->parent->id, $conversation->category->id]) }}">&ensp;/ {{ $conversation->category->name }}</a>
                                    </li>
                                    <li>&ensp;/ Users Conversation</li>
                                </ul>
                                <h3>Create New Conversation</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="Create_new_category col-md-12">
                <div class="categ_inputs add__word_record col-md-12">
                    <div class="col-md-12">

                        @if(!empty($errors->all()))
                            <div class="alert alert-danger col-md-12">
                                @foreach($errors->all() as $error)
                                    <p>{{ $error }}</p>
                                @endforeach
                            </div>
                        @endif

                        @if(session()->has('success'))
                            <div class="alert alert-success col-md-12">
                                <p>{{ session('success') }}</p>
                            </div>
                        @endif

                        <form class="row" method="post" action="{{ route('admin.new.conversations.view.item-store', $conversation) }}">
                            @csrf

                            <div class="col-md-2">
                                <p>User</p>
                                <select name="user" style="height: 50px;" class="form-control">
                                    <option value="Javi">Javi</option>
                                    <option value="Tracy">Tracy</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <p>Text EN</p>
                                <textarea style="height: 50px;" type="text" placeholder="" name="text_en"></textarea>
                            </div>

                            <div class="col-md-4">
                                <p>Text ES</p>
                                <textarea style="height: 50px;" type="text" placeholder="" name="text_es"></textarea>
                            </div>

                            <div class="col-md-2">
                                <div class="categ_btns">
                                    <button onclick="location.href = $('#referer-url').attr('href');" type="button" class="cancel__btn">Cancel</button>
                                    <button class="save__btn" type="submit">Save</button>
                                </div>
                            </div>
                        </form>

                        <hr>

                        @if($userConversations->count())
                            <br><h1 class="text-center">Conversations Already Stored</h1><br>

                            @foreach($userConversations as $userConversation)
                                <form class="row" method="post" action="{{ route('admin.new.conversations.view.item-store', [$conversation, $userConversation]) }}">
                                    @csrf

                                    <div class="col-md-2">
                                        <p>User</p>
                                        <select name="user" style="height: 50px;" class="form-control">
                                            <option value="Javi">Javi</option>
                                            <option {{ $userConversation->user == 'Tracy' ? 'selected' : '' }} value="Tracy">Tracy</option>
                                        </select>
                                    </div>

                                    <div class="col-md-4">
                                        <p>Text EN</p>
                                        <textarea style="height: 50px;" type="text" placeholder="" name="text_en">{{ $userConversation->text_en }}</textarea>
                                    </div>

                                    <div class="col-md-4">
                                        <p>Text ES</p>
                                        <textarea style="height: 50px;" type="text" placeholder="" name="text_es">{{ $userConversation->text_es }}</textarea>
                                    </div>

                                    <div class="col-md-2">
                                        <div class="categ_btns">
                                            <button onclick="location.href = '{{ route('admin.new.conversations.view.item-delete', $userConversation->id) }}';" type="button" class="cancel__btn">Delete</button>
                                            <button class="save__btn" type="submit">Save</button>
                                        </div>
                                    </div>
                                </form>
                            @endforeach
                        @endif

                    </div>
                </div>
            </section>
        </div>
    </main>
@endsection
@section('js')
    <script type="text/javascript">

    </script>
@stop
