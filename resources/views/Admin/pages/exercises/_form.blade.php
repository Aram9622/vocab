@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('css/exercises.css')}}">
    <style>
        .upload__word_box > * {
            margin-bottom: 20px;
        }

        .upload__word_box {
            flex-wrap: wrap;
        }

        .upload__word_box > section input {
            height: 99%;
            padding: 0;
            margin: 0;
            width: 90%;
            margin-left: 3px;
            border: aliceblue;
        }

        .upload__word_box > section i {
            cursor: pointer;
            position: absolute;
            right: 3px;
            top: 13px;
            color: blue;
        }

        .upload__word_box > section {
            position: relative;
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


<form action="{{ $route }}" method="post" enctype="multipart/form-data" class="row">
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
                                {{ in_array(old('type', $exercise->type), [null, 1]) ? 'checked' : '' }}
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
                                    <div class="upload__image_box {{ in_array(old('type', $exercise->type), [null, 1]) ? 'show active' : '' }}" id="with-picture">
                                        <p>Add picture (max 1mb)</p>
                                        <div class="upload__image">
                                            <div id="imagePreview"></div>
                                            <input id="uploadFile" type="file" name="image"
                                                   class="img">
                                        </div>
                                    </div>
                                    <div class="add_words_div {{ old('type', $exercise->type) == 2 ? 'show active' : '' }}" id="with-words">
                                        <p>Words to choose (delete input value to delete word)</p>
                                        <div class="upload__word_box">
                                            <div class="upload__word_btn">
                                                <button id="new-words" type="button">
                                                    +
                                                </button>
                                            </div>
                                            @if(is_array(old('words', $exercise->words)))
                                                @foreach(old('words', $exercise->words) as $word)
                                                    <section>
                                                        <input name="words[]" value="{{ $word }}">
                                                        <i class="fa fa-trash"></i>
                                                    </section>
                                                @endforeach
                                            @else
                                                <section>
                                                    <input name="words[]">
                                                    <i class="fa fa-trash"></i>
                                                </section>
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
                                            @if($exercise->category)
                                                <button type="button" onclick="location.href='{{ route('admin.new.exercises.add.item', [$exercise->category->parent->id, $exercise->category_id]) }}'" class="cancel__btn">Cancel</>
                                            @endif
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
        });

        $('#new-words').on('click', function () {
            $('.upload__word_box').append('<section> <input name="words[]"><i class="fa fa-trash"></i></section>');
        });

        $(document).delegate('.upload__word_box i', 'click', function () {
            $(this).closest('section').remove();
        });
    </script>
@stop
