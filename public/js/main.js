$('.nav-btn').on('click', function () {
    $('.dashboard_page-container').toggleClass('sbar_collapsed');
});


$(function() {

    $('.sidebar-menu>ul>li>a').click(function() {
        $('.sidebar-menu>ul>li>a').removeClass('active_page');
        $(this).addClass('active_page');
    });

    $('.sidebar-menu li.dropdown').click(function() {
        $(this).find('.dropdown_menu').toggleClass('active_menu');
    });
    $('.dropdown2').click(function() {
        $(this).parent('.dropdown_menu').toggleClass('active_menu');
        $(this).find('.dropdown_menu2').toggleClass('active_menu2');
    });


    $('.accordion_div').click(function() {
        $('.accordion_text').removeClass('show-div');
        $(this).find('.accordion_text').toggleClass('show-div');
    });
});

$(function() {
    $("#uploadFile").on("change", function() {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

        if (/^image/.test(files[0].type)) { // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function() { // set image data as background of div
                $("#imagePreview").css("background-image", "url(" + this.result + ")");
            }
        }
    });
    $('#imagePreview').click(function() {
        $('#uploadFile').trigger('click');
    });
});
$(function() {
    $("#uploadFile2").on("change", function() {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

        if (/^image/.test(files[0].type)) { // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function() { // set image data as background of div
                $("#imagePreview2").css("background-image", "url(" + this.result + ")");
            }
        }
    });
    $('#imagePreview2').click(function() {
        $('#uploadFile2').trigger('click');
    });
});
$(function() {
    $("#uploadFile3").on("change", function() {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

        if (/^image/.test(files[0].type)) { // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function() { // set image data as background of div
                $("#imagePreview3").css("background-image", "url(" + this.result + ")");
            }
        }
    });
    $('#imagePreview3').click(function() {
        $('#uploadFile3').trigger('click');
    });
});
$(function() {
    var btnTitle = $(".btn-upload-input-title").html();
    var btnTitleHtml = $.parseHTML(btnTitle);
    $(".btn-upload-input input:file").change(function (){
        console.log("im clicked" + this.files.length);
        if( this.files && this.files.length >= 1 ) {
            var file = this.files[0];
            var reader = new FileReader();
            // Set preview image into the popover data-content
            reader.onload = function (e) {
                $(".btn-upload-input-title").text(file.name);
            }
            reader.readAsDataURL(file);
        }
        else {
            $(".btn-upload-input-title").html(btnTitle);
        }

    });
});

$(function() {
    var btnTitle2 = $(".btn-upload-input-title2").html();
    var btnTitleHtml2 = $.parseHTML(btnTitle2);
    $(".btn-upload-input2 input:file").change(function (){
        console.log("im clicked" + this.files.length);
        if( this.files && this.files.length >= 1 ) {
            var file2 = this.files[0];
            var reader2 = new FileReader();
            // Set preview image into the popover data-content
            reader2.onload = function (e) {
                $(".btn-upload-input-title2").text(file2.name);
            }
            reader2.readAsDataURL(file2);
        }
        else {
            $(".btn-upload-input-title2").html(btnTitle2);
        }

    });
});
$(function() {
    var btnTitle = $(".btn-upload-input-title").html();
    var btnTitleHtml = $.parseHTML(btnTitle);
    $(".btn-upload-input input:file").change(function (){
        console.log("im clicked" + this.files.length);
        if( this.files && this.files.length >= 1 ) {
            var file = this.files[0];
            var reader = new FileReader();
            // Set preview image into the popover data-content
            reader.onload = function (e) {
                $(".btn-upload-input-title").text(file.name);
            }
            reader.readAsDataURL(file);
        }
        else {
            $(".btn-upload-input-title").html(btnTitle);
        }

    });
});

$(function() {
    var btnTitle1 = $(".btn-upload-input-title-1").html();
    var btnTitleHtml1 = $.parseHTML(btnTitle1);
    $(".btn-upload-input-1 input:file").change(function (){
        console.log("im clicked" + this.files.length);
        if( this.files && this.files.length >= 1 ) {
            var file1 = this.files[0];
            var reader1 = new FileReader();
            // Set preview image into the popover data-content
            reader1.onload = function (e) {
                $(".btn-upload-input-title-1").text(file1.name);
            }
            reader1.readAsDataURL(file1);
        }
        else {
            $(".btn-upload-input-title-1").html(btnTitle1);
        }

    });
});
$(function() {
    var btnTitle21 = $(".btn-upload-input-title2-1").html();
    var btnTitleHtml21 = $.parseHTML(btnTitle21);
    $(".btn-upload-input2-1 input:file").change(function (){
        console.log("im clicked" + this.files.length);
        if( this.files && this.files.length >= 1 ) {
            var file21 = this.files[0];
            var reader21 = new FileReader();
            // Set preview image into the popover data-content
            reader21.onload = function (e) {
                $(".btn-upload-input-title2-1").text(file21.name);
            }
            reader21.readAsDataURL(file21);
        }
        else {
            $(".btn-upload-input-title2-1").html(btnTitle21);
        }

    });
});