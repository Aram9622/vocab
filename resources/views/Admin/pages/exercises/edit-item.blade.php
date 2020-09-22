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
                    @include('Admin.pages.exercises._form', ['route' => route('admin.new.exercises.update.item', $exercise)])
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
