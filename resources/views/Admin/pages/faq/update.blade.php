@extends('layouts.master')
@section('content')
    <main class="main-content">
        <div class="nav-btn pull-left">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="dashboard_content">
            <div class="dashboard_content">
                <div class="container-fluid">
                    <div class="content_topMenu">
                        <ul>
                            <li><a href="">FAQs</a></li>
                        </ul>
                    </div>
                    <div class="dashboard_box">

                        @if(session()->has('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif

                        @include('Admin.pages.faq.form', ['model' => $model])
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection


