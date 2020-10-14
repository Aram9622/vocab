<script src="{{asset('lib/js/jquery-3.3.1.min.js')}}"></script>
<script src="{{asset('lib/bootstrap/js/bootstrap.min.js')}}"></script>

<!-- Main JS -->
<script src="{{asset('js/main.js')}}"></script>

{{--<script src="https://cdn.ckeditor.com/ckeditor5/19.0.0/classic/ckeditor.js"></script>--}}
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>

<script>
    // ClassicEditor.create(document.querySelector('#editor')).then(function (editor) {}).catch(function (error) {});

    // See the bellow link to understand how to enable html,css attributes
    // https://ckeditor.com/docs/ckeditor4/latest/guide/dev_allowed_content_rules.html

    CKSettings = {
        allowedContent: {
//            div: {
//                classes: true,
//                styles: true
//            },
//            span: {
//                classes: true,
//                styles: true
//            },
//            p: {
//                classes: true,
//                styles: true
//            },
//            h2: {
//                classes: true,
//                styles: true
//            },
//            h3: {
//                classes: true,
//                styles: true
//            },
//            a: {
//                href: true,
//                classes: true,
//                styles: true
//            }
            $1: {
                attributes: true,
                styles: true,
                classes: true
            }
        }
    };

    CKEDITOR.replace('editor', CKSettings);
    CKEDITOR.replace('extra-editor', CKSettings);
</script>
@yield('js')
