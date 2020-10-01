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
                        <li><a href="">My Exercises</a></li>
                    </ul>
                </div>
                @if($errors->all() && !empty($errors->all()))
                    <ul class="alert alert-warning" style="font-size: 12px;list-style: none;text-align: center;">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif
                @if(session()->has('success'))
                    <div class="alert alert-success">
                        <h1 class="text-center">Form data successfully saved</h1>
                    </div>
                @endif
                <div class="dashboard_box">
                    @include('Admin.pages.exercises._form', ['route' => route('admin.new.exercises.update.item', $exercise)])
                </div>
            </div>
        </div>
    </main>
@endsection
