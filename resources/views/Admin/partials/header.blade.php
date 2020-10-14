<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>
        @if(isset($title))
            Dashboard – {{ $title }}
        @else
            Dashboard
        @endif
    </title>

    <!-- Bootstrap core CSS -->
    <link href="{{asset('lib/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Main CSS -->
    <link href="{{asset('css/style.css')}}" rel="stylesheet">
    @yield('css')
    <style>
        .upload__image #imagePreview {
            background-size: cover;
        }
        #editor + .ck .ck-editor__editable_inline {
            min-height: 500px;
        }
    </style>
</head>

<body>
    <div class="dashboard_page-container">
