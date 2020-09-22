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
                        <li><a href="">News</a></li>
                    </ul>
                </div>
                <div class="dashboard_box">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="categories_top_sect">
                                <h3>Create new news</h3>
                                <div class="Create_new_category">
                                    <form method="POST" enctype="multipart/form-data" action="{{route('admin.news.store')}}">
                                        @csrf
                                        <div class="row">
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
                                                    <div class="news_input">
                                                        <p>Title</p>
                                                        <input type="text" placeholder="Title" name="title">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7"></div>
                                        </div>
                                        <div class="Newstextarea-row">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <div class="categ_inputs">
                                                        <div class="news_textarea">
                                                            <p>News</p>
                                                            <textarea placeholder="Write here" name="description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="categ_inputs">
                                                        <div class="categ_btns">
                                                            <button class="cancel__btn">Cancel</button>
                                                            <button class="save__btn">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <ul class="bg-danger error-content">
                                        @foreach ($errors->all() as $error)
                                            <li class="text-white">{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                            <div class="categories_sect">
                                <h3>News</h3>
                                <div class="Vocabulary_table table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th scope="col">Picture</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">English</th>
                                            <th scope="col">Visible</th>
                                            <th scope="col"></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($news as $item)
                                                <tr>
                                                    <td>
                                                        <div class="picture__div">
                                                            <a href="{{asset('uploads/news/'.$item->image)}}" target="_blank"><img src="{{asset('uploads/news/'.$item->image)}}"></a>
                                                        </div>
                                                    </td>
                                                    <td>{{$item->title}}</td>
                                                    <td>{{$item->description}}</td>
                                                    <td>
                                                        <div class="visible__div">
                                                            <label class="switch">
                                                                <input type="checkbox" data-id="{{$item->id}}" @if($item->visible == 1) checked @endif>
                                                                <span class="slider round"></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="edit__div">
                                                            <a class="edit__btn" href="{{ route('admin.news.edit.item', $item->id) }}"><img src="{{asset('images/edit.svg')}}"></a>
                                                            <a class="delete__btn" href="{{route('admin.news.delete', $item->id)}}" onclick="return confirm('Are you sure you want to delete?')"><img src="images/delete.svg"></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pagination_div" style="min-width: 300px;">
{{--                                    <div class="pagination">--}}
{{--                                        <a href="#">--}}
{{--                                            |<--}}
{{--                                        </a>--}}
{{--                                        <a href="#" class="active">1</a>--}}
{{--                                        <a href="#">2</a>--}}
{{--                                        <a href="#">3</a>--}}
{{--                                        <a href="#">4</a>--}}
{{--                                        <a href="#">5</a>--}}
{{--                                        <a href="#"> >| </a>--}}
{{--                                    </div>--}}
                                    {{ $news->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
@section('css')
<style>
    .pagination {
        display: flex;
        flex-wrap: wrap;
    }
    .page-item.disabled {
        display: none;
    }
</style>
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
            url: "{{route('admin.news.visibility.item')}}",
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
