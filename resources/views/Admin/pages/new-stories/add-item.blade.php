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
                        <li><a href="">&ensp;/ Stories</a></li>
                        <li><a href="">&ensp;/ {{ ucfirst(request()->segment(3)) }}</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <ul class="categ__menu">
                                    <li><a href="">Categories </a></li>
                                    <li><a href="{{ route('admin.new.stories.index', [request()->segment(3), $category->id]) }}">&ensp;/ {{ $category->name }}</a></li>
                                    <li>&ensp;/ {{ $sub_category->name }}</li>
                                </ul>
                                <h3>Create new world</h3>
                                <div class="Create_new_category">
                                    <form action="{{route('admin.new.stories.store.item', $sub_category->id)}}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="categ_inputs">
                                                    <div class="add__word_record">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div>
                                                                    <p>English Title</p>
                                                                    <input style="max-width: 100%;" type="text" placeholder="Flower" name="story_en">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="add__word_record">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div>
                                                                    <p>Spanish Title</p>
                                                                    <input style="max-width: 100%;" type="text" placeholder="Flor" name="story_es">
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
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <p>English Sub Title</p>
                                                    <input name="sub_title_en" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <p>English Description</p>
                                                    <textarea rows="5" name="description_en" class="form-control"></textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <p>Spanish Sub Title</p>
                                                    <input name="sub_title_es" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <p>Spanish Description</p>
                                                    <textarea rows="5" name="description_es" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="categ_btns">
                                            <button class="cancel__btn">Cancel</button>
                                            <button class="save__btn">Save</button>
                                        </div>

                                        <div class="row">
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
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($stories as $story)
                                            <tr>
                                                <td>{{$story->story_en}}</td>
                                                <td>
                                                    <audio controls>
                                                      <source src="{{ asset('uploads/audio/'.$story->record_en) }}" type="audio/ogg">
                                                      <source src="{{ asset('uploads/audio/'.$story->record_en) }}" type="audio/mpeg">
                                                    Your browser does not support the audio element.
                                                    </audio>
                                                </td>
                                                <td>{{$story->story_es}}</td>
                                                <td>
                                                    <audio controls>
                                                      <source src="{{ asset('uploads/audio/'.$story->record_es) }}" type="audio/ogg">
                                                      <source src="{{ asset('uploads/audio/'.$story->record_es) }}" type="audio/mpeg">
                                                    Your browser does not support the audio element.
                                                    </audio>
                                                </td>
                                                <td>
                                                    <div class="picture__div">
                                                        <a href="{{asset('uploads/stories/'.$story->image)}}" target="_blank"><img src="{{asset('uploads/stories/'.$story->image)}}"></a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="visible__div">
                                                        <label class="switch">
                                                            <input type="checkbox" data-id="{{$story->id}}" @if($story->visible == 1) checked="checked" @endif>
                                                            <span class="slider round"></span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="link__div"><a href="">{{$story->eg_link}}</a></div>
                                                </td>
                                                <td>
                                                    <div class="edit__div">
                                                        <a class="edit__btn" href="{{ route('admin.new.stories.edit.item', $story->id) }}"><img src="{{asset('images/edit.svg')}}"></a>
                                                        <form action="{{ route('admin.new.stories.delete.item', $story->id) }}" method="post">
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
                                {{ $stories->links() }}
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
            url: "{{route('admin.new.stories.visibility.item')}}",
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
