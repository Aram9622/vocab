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
                                    <li><a href="{{ route('admin.new.conversations.index', [request()->segment(3), $category->id]) }}">&ensp;/ {{ $category->name }}</a></li>
                                    <li>&ensp;/ {{ $sub_category->name }}</li>
                                </ul>
                                <h3>Create new world</h3>
                                <div class="Create_new_category">
                                    <form action="{{route('admin.new.conversations.store.item', $sub_category->id)}}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div class="add__word_record">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>English word</p>
                                                                    <input type="text" placeholder="Flower" name="conversation_en">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Add English record</p>
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
                                                    <div class="add__word_record">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Spanish word</p>
                                                                    <input type="text" placeholder="Flor" name="conversation_es">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div>
                                                                    <p>Add Spanish record</p>
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
                                                    <p>Add picture (max 1mb)</p>
                                                    <div class="upload__image">
                                                        <div id="imagePreview"></div>
                                                        <input id="uploadFile" type="file" name="image" class="img">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="categ_inputs">
                                                    <div class="link_input">
                                                        <p>Add E.G. link</p>
                                                        <input type="text" placeholder="Lorem ipsum dolor sit amet." name="eg_link">
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
                            <div class="categories_sect">
                                <h3>Vocabulary</h3>
                                <div class="Vocabulary_table table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th scope="col">English</th>
                                            <th scope="col">Voice record</th>
                                            <th scope="col">Spanish</th>
                                            <th scope="col">Voice record</th>
                                            <th scope="col">Picture</th>
                                            <th scope="col">Visible</th>
                                            <th scope="col">E.G. link</th>
                                            <th scope="col">Conversation</th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($conversations as $conversation)
                                            <tr>
                                                <td>{{$conversation->conversation_en}}</td>
                                                <td>
                                                    <audio controls>
                                                      <source src="{{ asset('uploads/audio/'.$conversation->record_en) }}" type="audio/ogg">
                                                      <source src="{{ asset('uploads/audio/'.$conversation->record_en) }}" type="audio/mpeg">
                                                    Your browser does not support the audio element.
                                                    </audio>
                                                </td>
                                                <td>{{$conversation->conversation_es}}</td>
                                                <td>
                                                    <audio controls>
                                                      <source src="{{ asset('uploads/audio/'.$conversation->record_es) }}" type="audio/ogg">
                                                      <source src="{{ asset('uploads/audio/'.$conversation->record_es) }}" type="audio/mpeg">
                                                    Your browser does not support the audio element.
                                                    </audio>
                                                </td>
                                                <td>
                                                    <div class="picture__div">
                                                        <a href="{{asset('uploads/conversations/'.$conversation->image)}}" target="_blank"><img src="{{asset('uploads/conversations/'.$conversation->image)}}"></a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="visible__div">
                                                        <label class="switch">
                                                            <input type="checkbox" data-id="{{$conversation->id}}" @if($conversation->visible == 1) checked="checked" @endif>
                                                            <span class="slider round"></span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="link__div"><a href="">{{$conversation->eg_link}}</a></div>
                                                </td>
                                                <td>
                                                    <div class="edit__div text-center">
                                                        <a class="btn btn-sm btn-primary" href="{{ route('admin.new.conversations.view.item-view', $conversation->id) }}">
                                                            <i class="fa fa-eye"></i> View
                                                        </a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="edit__div">
                                                        <a class="edit__btn" href="{{ route('admin.new.conversations.edit.item', $conversation->id) }}"><img src="{{asset('images/edit.svg')}}"></a>
                                                        <form action="{{ route('admin.new.conversations.delete.item', $conversation->id) }}" method="post">
                                                            @csrf
                                                        <button class="delete__btn" type="submit" onclick="return confirm('Are you sure you want to delete?')"><img src="{{asset('images/delete.svg')}}"></button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                {{ $conversations->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
@section('js')
<script type="text/javascript">
    $('.visible__div input').on('change', function(){
        if ($(this).is(':checked')) {
            var visible = 1;
        }else {
            var visible = 0;
        }
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('admin.new.conversations.visibility.item')}}",
            data: {
                item: $(this).data('id'),
                visible: visible,
            },
            type: 'POST',
            success:function(response){
                if (response.error != false) {
                    alert('Oops..');
                }
            }
        });
    })
</script>
@stop
