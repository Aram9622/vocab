@extends('layouts.master')
@section('css')
<link rel="stylesheet" type="text/css" href="{{asset('css/exercises.css')}}">
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
               <div class="dashboard_box">
                   <div class="row">
                       <div class="col-md-12 col-sm-12 col-xs-12">
                           <div class="categories_top_sect">
                               <ul class="categ__menu">
                                   <li>My Exercises</li>
                               </ul>
                               <h3>Create new Exercise</h3>


                               <div class="select_type_div">
                                   <p>Select Type</p>
                                   <ul class="nav nav-pills">
                                       <li class="active"><a data-toggle="pill" class="active show"
                                                             href="#with-picture">
                                           <label class="select_type">With Picture
                                               <input type="checkbox" checked="checked">
                                               <span class="checkmark"></span>
                                           </label>
                                       </a></li>
                                       <li><a data-toggle="pill" href="#with-words">
                                           <label class="select_type">With Words
                                               <input type="checkbox">
                                               <span class="checkmark"></span>
                                           </label>
                                       </a></li>
                                   </ul>
                                   <div class="tab-content">
                                       <div class="tab-pane fade in active show picture_section" id="with-picture">
                                           <div class="Create_new_category">
                                               <div class="row">
                                                   <div class="col-md-2">
                                                       <div class="upload__image_box">
                                                           <p>Add picture (max 1mb)</p>
                                                           <div class="upload__image">
                                                               <div id="imagePreview"></div>
                                                               <input id="uploadFile" type="file" name="image"
                                                                      class="img">
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-5">
                                                       <div class="categ_inputs">
                                                           <div class="news_input">
                                                               <p>Title</p>
                                                               <input type="text"
                                                                      placeholder="Lorem ipsum dolor sit amet.">
                                                           </div>
                                                       </div>
                                                       <div class="add__word_record">
                                                           <div class="row">
                                                               <div class="col-md-6">
                                                                   <div>
                                                                       <p>Add English record</p>
                                                                       <div class="upload__record">
                                                                           <form>
                                                                               <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input">
                                                                 <span class="btn-upload-input-title">Upload record</span>
                                                                 <input type="file" name="input-file-preview"/>
                                                              </div>
                                                          </span>
                                                                               </div>
                                                                           </form>
                                                                       </div>
                                                                   </div>
                                                               </div>
                                                               <div class="col-md-6">
                                                                   <div>
                                                                       <p>Add Spanish record</p>
                                                                       <div class="upload__record">
                                                                           <form>
                                                                               <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input2">
                                                                 <span class="btn-upload-input-title2">Upload record</span>
                                                                 <input type="file" name="input-file-preview2"/>
                                                              </div>
                                                          </span>
                                                                               </div>
                                                                           </form>
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
                                                               <textarea placeholder="Write here"></textarea>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <div class="categ_inputs">
                                                           <div class="news_textarea">
                                                               <p>Spanish Exercise (to make word invisible use this
                                                                   example
                                                                   *example*)</p>
                                                               <textarea placeholder="Write here"></textarea>
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
                                                               <button class="cancel__btn">Cancel</button>
                                                               <button class="save__btn">Save</button>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="tab-pane fade words_section" id="with-words">
                                           <div class="Create_new_category">
                                               <div class="add_words_div">
                                                   <p>Words to choose</p>
                                                   <div class="upload__word_box">
                                                       <div class="upload__word_btn">
                                                           <button>+</button>
                                                       </div>
                                                       <p>Lorem</p>
                                                       <p>Lorem</p>
                                                       <p>Lorem</p>
                                                       <p>Lorem</p>
                                                       <p>Lorem</p>
                                                       <p>Lorem</p>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-md-3">
                                                       <div class="categ_inputs">
                                                           <div class="news_input">
                                                               <p>Title</p>
                                                               <input type="text"
                                                                      placeholder="Lorem ipsum dolor sit amet.">
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                       <div class="add__word_record">
                                                           <div class="row">
                                                               <div class="col-md-6">
                                                                   <div>
                                                                       <p>Add English record</p>
                                                                       <div class="upload__record">
                                                                           <form>
                                                                               <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input">
                                                                 <span class="btn-upload-input-title">Upload record</span>
                                                                 <input type="file" name="input-file-preview"/>
                                                              </div>
                                                          </span>
                                                                               </div>
                                                                           </form>
                                                                       </div>
                                                                   </div>
                                                               </div>
                                                               <div class="col-md-6">
                                                                   <div>
                                                                       <p>Add Spanish record</p>
                                                                       <div class="upload__record">
                                                                           <form>
                                                                               <div class="input-group btn-upload">
                                                          <span class="input-group-btn">
                                                             <div class="btn btn-upload-input2">
                                                                 <span class="btn-upload-input-title2">Upload record</span>
                                                                 <input type="file" name="input-file-preview2"/>
                                                              </div>
                                                          </span>
                                                                               </div>
                                                                           </form>
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
                                                               <textarea placeholder="Write here"></textarea>
                                                           </div>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <div class="categ_inputs">
                                                           <div class="news_textarea">
                                                               <p>Spanish Exercise (to make word invisible use this
                                                                   example
                                                                   *example*)</p>
                                                               <textarea placeholder="Write here"></textarea>
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
                                                               <button class="cancel__btn">Cancel</button>
                                                               <button class="save__btn">Save</button>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </div>


                               </div>

                           </div>
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
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox">
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox">
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <div class="picture__div">
                                                               <img src="images/picture.png">
                                                           </div>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   </tbody>
                                               </table>
                                           </div>
                                           <div class="pagination_div">
                                               <div class="pagination">
                                                   <a href="#">
                                                       |<
                                                   </a>
                                                   <a href="#" class="active">1</a>
                                                   <a href="#">2</a>
                                                   <a href="#">3</a>
                                                   <a href="#">4</a>
                                                   <a href="#">5</a>
                                                   <a href="#"> >| </a>
                                               </div>
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
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox">
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="audio_icon">
                                                                   <img src="images/play.svg">
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox">
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   <tr>
                                                       <td>
                                                           <p>Lorem ipsum dolor sit amet, consetetur.</p>
                                                       </td>
                                                       <td>Lorem ipsum dolor sit amet, consetetur.</td>
                                                       <td>
                                                           <div class="accordion_div">
                                                               <p>Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr, sed diam nonumy
                                                                   eirmod tempor invidunt ut labore et dolore magna
                                                                   aliquyam erat,
                                                                   sed.</p>
                                                               <p class="accordion_text">diam voluptua. At vero eos et
                                                                   accusam et justo duo dolores et ea
                                                                   rebum. Stet
                                                                   clita kasd gubergren, no sea takimata sanctus est
                                                                   Lorem ipsum
                                                                   dolor sit
                                                                   amet. Lorem ipsum dolor sit amet, consetetur
                                                                   sadipscing elitr,
                                                                   sed diam
                                                                   nonumy eirmod tempor invidunt ut labore et dolore
                                                                   magna aliquyam
                                                                   erat,
                                                                   sed diam voluptua. At vero eos et accusam et justo
                                                                   duo dolores
                                                                   et ea
                                                                   rebum. Stet clita kasd gubergren, no sea takimata
                                                                   sanctus est
                                                                   Lorem
                                                                   ipsum dolor sit amet. Lorem ipsum dolor sit amet,
                                                                   consetetur
                                                                   sadipscing
                                                                   elitr, sed diam nonumy eirmod tempor invidunt ut
                                                                   labore et
                                                                   dolore magna
                                                                   aliquyam erat, sed diam voluptua. At vero eos et
                                                                   accusam et
                                                                   justo duo
                                                                   dolores et ea rebum. Stet clita kasd gubergren, no
                                                                   sea takimata
                                                                   sanctus
                                                                   est Lorem ipsum.</p>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="audio_player_div">
                                                               <div class="play-pause-btn" style="display: block;">
                                                                   <img src="images/icon.svg">
                                                               </div>
                                                               <div class="controls">
                                                                   <progress max="100" value="55"></progress>
                                                                   <span class="total-time">0:57</span>
                                                               </div>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="visible__div">
                                                               <label class="switch">
                                                                   <input type="checkbox" checked>
                                                                   <span class="slider round"></span>
                                                               </label>
                                                           </div>
                                                       </td>
                                                       <td>
                                                           <div class="edit__div">
                                                               <button class="edit__btn"><img src="images/edit.svg">
                                                               </button>
                                                               <button class="delete__btn"><img
                                                                       src="images/delete.svg"></button>
                                                           </div>
                                                       </td>
                                                   </tr>
                                                   </tbody>
                                               </table>
                                           </div>
                                           <div class="pagination_div">
                                               <div class="pagination">
                                                   <a href="#">
                                                       |<
                                                   </a>
                                                   <a href="#" class="active">1</a>
                                                   <a href="#">2</a>
                                                   <a href="#">3</a>
                                                   <a href="#">4</a>
                                                   <a href="#">5</a>
                                                   <a href="#"> >| </a>
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
       </div>
   </main>
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
            url: "{{route('admin.new.phrases.visibility.item')}}",
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