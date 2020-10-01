<!DOCTYPE html>
 <html>
 <head>
     <title>Login</title>
     <link rel="stylesheet" type="text/css" href="{{asset('css/login.css')}}">
 </head>
 <body>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <div class="wrapper fadeInDown">
      <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
          <img src="{{asset('images/user.png')}}" id="icon" alt="User Icon" />
        </div>

        <!-- Login Form -->
        <form method="POST" action="{{ route('login') }}">
            @csrf
          <input type="email" id="login" class="fadeIn second" name="email" value="{{ old('email') }}" placeholder="{{ __('E-Mail Address') }}">
          @error('email')
              <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
              </span>
          @enderror
          <input type="password" id="password" class="fadeIn third" name="password" placeholder="{{ __('Password') }}">
          @error('password')
              <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
              </span>
          @enderror
          <input type="submit" class="fadeIn fourth" value="Log In">
        </form>

      </div>
    </div>
 </body>
 </html>