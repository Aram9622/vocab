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
                    @include('Admin.pages.exercises._form', ['route' => route('admin.new.exercises.store.item', request()->segment(3))])

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
