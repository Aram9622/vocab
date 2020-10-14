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
                            <li><a href="">Terms Of Use</a></li>
                        </ul>
                    </div>
                    <div class="dashboard_box">

                        <div style="margin-bottom: 20px;float: right;">
                            <a class="btn btn-lg btn-primary" href="{{ route('admin.privacy-policy.create') }}"> &nbsp; Create New &nbsp; </a>
                        </div>

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Question</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                                <th>Action Buttons</th>
                            </tr>
                            </thead>
                            <tbody id="post-data">
                            @include('Admin.pages.privacy-policy.data')
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
