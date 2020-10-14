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
                            <li><a href="">{{ $title }}</a></li>
                        </ul>
                    </div>
                    <div class="dashboard_box">
                        <form method="post" action="{{ route('admin.info.store') }}">
                            @csrf

                            <div class="form-group">
                                <textarea class="form-control" name="{{ $name }}">{{ \App\Models\Option::item($name) }}</textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit" style="float: right;" class="btn btn-lg btn-primary"> &nbsp; Save &nbsp; </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
