@extends('layouts.master')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('css/exercises.css')}}">
    <style>
        .upload__word_box > input {
            padding: 10px 15px;
            max-width: 160px;
            width: 100%;
            height: 48px;
            border: 1px solid #BABAC7;
            border-radius: 4px;
            font-family: "Roboto-Regular";
            font-size: 16px;
            color: #000000;
            margin-right: 40px;
        }
        #with-words, #with-picture {
            display: none;
        }

        #with-words.show, #with-picture.show {
            display: block;
        }
    </style>
@stop

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
                        <li><a href="">My Exercises</a></li>
                    </ul>
                </div>
                @if($errors->all() && !empty($errors->all()))
                    <ul class="alert alert-danger">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif
                <div class="dashboard_box">
                    <form action="{{ route('admin.new.exercises.store.item', request()->segment(3)) }}" method="post" enctype="multipart/form-data" class="row">
                        @csrf
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <ul class="categ__menu">
                                    <li>My Exercises</li>
                                </ul>
                                <h3>Create new Exercise</h3>


                                <div class="select_type_div">
                                    <p>Select Type</p>
                                    <ul class="nav nav-pills">
                                        <li>
                                            <label class="select_type active show" for="t1">With Picture
                                                <input
                                                    {{ old('type', $exercise->type) == 1 ? 'checked' : '' }}
                                                    onchange="$('#with-picture, #with-words').toggleClass('show active');"
                                                    id="t1" name="type" value="1" type="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </li>
                                        <li>
                                            <label class="select_type" for="t2">With Words
                                                <input
                                                    {{ old('type', $exercise->type) == 2 ? 'checked' : '' }}
                                                    onchange="$('#with-picture, #with-words').toggleClass('show active');"
                                                    id="t2" name="type" value="2" type="radio">
                                                <span class="checkmark"></span>
                                            </label>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade in active show picture_section">
                                            <div class="Create_new_category">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="upload__image_box {{ old('type', $exercise->type) == 1 ? 'show active' : '' }}" id="with-picture">
                                                            <p>Add picture (max 1mb)</p>
                                                            <div class="upload__image">
                                                                <div id="imagePreview"></div>
                                                                <input id="uploadFile" type="file" name="image"
                                                                       class="img">
                                                            </div>
                                                        </div>
                                                        <div class="add_words_div {{ old('type', $exercise->type) == 2 ? 'show active' : '' }}" id="with-words">
                                                            <p>Words to choose</p>
                                                            <div class="upload__word_box">
                                                                <div class="upload__word_btn">
                                                                    <button
                                                                        type="button"
                                                                        onclick="$('.upload__word_box').append('<input name=words[]>'); return false;">
                                                                        +
                                                                    </button>
                                                                </div>
                                                                @if(is_array(old('words', $exercise->words)))
                                                                    @foreach(old('words', $exercise->words) as $word)
                                                                        <input name="words[]" value="{{ $word }}">
                                                                    @endforeach
                                                                @else
                                                                    <input name="words[]">
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <div class="categ_inputs">
                                                            <div class="news_input">
                                                                <p>Title</p>
                                                                <input type="text" name="title" required
                                                                       value="{{ old('title', $exercise->title) }}"
                                                                       placeholder="Lorem ipsum dolor sit amet.">
                                                            </div>
                                                        </div>
                                                        <div class="add__word_record">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <p>Add English record</p>
                                                                        <div class="upload__record">
                                                                            <div>
                                                                                <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input">
                                                                 <span
                                                                     class="btn-upload-input-title">Upload record</span>
                                                                 <input type="file" name="record_en"/>
                                                              </div>
                                                          </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div>
                                                                        <p>Add Spanish record</p>
                                                                        <div class="upload__record">
                                                                            <div>
                                                                                <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input2">
                                                                 <span
                                                                     class="btn-upload-input-title2">Upload record</span>
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
                                                    <div class="col-md-5"></div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="categ_inputs">
                                                            <div class="news_textarea">
                                                                <p>English Exercise (to make word invisible use this
                                                                    example
                                                                    *example*)</p>
                                                                <textarea name="exercise_en" required placeholder="Write here">{{ old('exercise_en', $exercise->exercise_en) }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="categ_inputs">
                                                            <div class="news_textarea">
                                                                <p>Spanish Exercise (to make word invisible use this
                                                                    example
                                                                    *example*)</p>
                                                                <textarea name="exercise_es" required placeholder="Write here">{{ old('exercise_es', $exercise->exercise_es) }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="categ_inputs categ_btns_div">
                                                            <div class="categ_btns">
                                                                <button type="button" class="cancel__btn">Cancel</button>
                                                                <button type="submit" class="save__btn">Save</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>


                    <div class="categories_sect">
                        <div class="table_container">
                            <div class="table_tabs">
                                <ul class="nav nav-pills">
                                    <li class="active"><a data-toggle="pill" class="active show"
                                                          href="#picture">With Picture</a></li>
                                    <li><a data-toggle="pill" href="#words">With Words</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade in active show picture_section" id="picture">
                                    <div class="Vocabulary_table table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th scope="col">Picture</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">English</th>
                                                <th scope="col">Voice record (English)</th>
                                                <th scope="col">Visible</th>
                                                <th scope="col"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($exercises_1 as $exercise)
                                                <tr>
                                                    <td>
                                                        <div class="picture__div">
                                                            <img src="{{ $exercise->getImagePath('exercises', true) }}">
                                                        </div>
                                                    </td>
                                                    <td>{{ $exercise->title }}</td>
                                                    <td>
                                                        <div class="accordion_div">
                                                            <p>{{ \Illuminate\Support\Str::limit($exercise->exercise_en, 100) }}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="audio_player_div">
                                                            <div class="audio_icon">
                                                                <audio controls>
                                                                    <source src="{{ asset('uploads/audio/'.$exercise->record_en) }}" type="audio/ogg">
                                                                    <source src="{{ asset('uploads/audio/'.$exercise->record_en) }}" type="audio/mpeg">
                                                                    Your browser does not support the audio element.
                                                                </audio>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="visible__div">
                                                            <label class="switch">
                                                                <input type="checkbox"  data-id="{{$exercise->id}}" @if($exercise->visible == 1) checked="checked" @endif>
                                                                <span class="slider round"></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="edit__div">
                                                            <a class="edit__btn" href="{{ route('admin.new.exercises.edit.item', $exercise->id) }}"><img src="{{asset('images/edit.svg')}}"></a>
                                                            <a class="delete__btn" href="{{route('admin.new.exercises.delete.item', $exercise->id)}}" onclick="return confirm('Are you sure you want to delete?')"><img src="{{asset('images/delete.svg')}}"></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination_div">
                                        {{--                                               <div class="pagination">--}}
                                        {{--                                                   <a href="#">--}}
                                        {{--                                                       |<--}}
                                        {{--                                                   </a>--}}
                                        {{--                                                   <a href="#" class="active">1</a>--}}
                                        {{--                                                   <a href="#">2</a>--}}
                                        {{--                                                   <a href="#">3</a>--}}
                                        {{--                                                   <a href="#">4</a>--}}
                                        {{--                                                   <a href="#">5</a>--}}
                                        {{--                                                   <a href="#"> >| </a>--}}
                                        {{--                                               </div>--}}
                                    </div>
                                </div>
                                <div class="tab-pane fade words_section" id="words">
                                    <div class="Vocabulary_table table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th scope="col">Words To Choose</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">English</th>
                                                <th scope="col">Voice record (English)</th>
                                                <th scope="col">Visible</th>
                                                <th scope="col"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($exercises_2 as $exercise)
                                                <tr>
                                                    <td>
                                                        <p>{{ $exercise->words }}</p>
                                                    </td>
                                                    <td>{{ $exercise->title }}</td>
                                                    <td>
                                                        <div class="accordion_div">
                                                            <p>{{ \Illuminate\Support\Str::limit($exercise->exercise_en, 100) }}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="audio_player_div">
                                                            <div class="audio_icon">
                                                                <audio controls>
                                                                    <source src="{{ asset('uploads/audio/'.$exercise->record_en) }}" type="audio/ogg">
                                                                    <source src="{{ asset('uploads/audio/'.$exercise->record_en) }}" type="audio/mpeg">
                                                                    Your browser does not support the audio element.
                                                                </audio>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="visible__div">
                                                            <label class="switch">
                                                                <input type="checkbox"  data-id="{{$exercise->id}}" @if($exercise->visible == 1) checked="checked" @endif>
                                                                <span class="slider round"></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="edit__div">
                                                            <a class="edit__btn" href="{{ route('admin.new.exercises.edit.item', $exercise->id) }}"><img src="{{asset('images/edit.svg')}}"></a>
                                                            <a class="delete__btn" href="{{route('admin.new.exercises.delete.item', $exercise->id)}}" onclick="return confirm('Are you sure you want to delete?')"><img src="{{asset('images/delete.svg')}}"></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination_div">
                                        {{--                                               <div class="pagination">--}}
                                        {{--                                                   <a href="#">--}}
                                        {{--                                                       |<--}}
                                        {{--                                                   </a>--}}
                                        {{--                                                   <a href="#" class="active">1</a>--}}
                                        {{--                                                   <a href="#">2</a>--}}
                                        {{--                                                   <a href="#">3</a>--}}
                                        {{--                                                   <a href="#">4</a>--}}
                                        {{--                                                   <a href="#">5</a>--}}
                                        {{--                                                   <a href="#"> >| </a>--}}
                                        {{--                                               </div>--}}
                                    </div>
                                </div>
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
        $('.visible__div input').on('change', function () {
            if ($(this).is(':checked')) {
                var visible = 1;
            } else {
                var visible = 0;
            }

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{route('admin.new.exercises.visibility.item')}}",
                data: {
                    item: $(this).data('id'),
                    visible: visible,
                },
                type: 'POST',
                success: function (response) {
                    if (response.error != false) {
                        alert('Oops..');
                    }
                }
            });
        })
    </script>
@stop
