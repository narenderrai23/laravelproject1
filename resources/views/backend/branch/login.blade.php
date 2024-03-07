<!doctype html>
<html lang="en">

<head>

    <title>
        Login {{ config('app.name') }} - Admin
    </title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin" name="description" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.png">

    <!-- Bootstrap Css -->
    <link href="../assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="../assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body data-layout="vertical" data-sidebar="dark">

    <div class="authentication-bg min-vh-100">
        <div class="bg-overlay"></div>
        <div class="container">
            <div class="d-flex flex-column min-vh-100 px-3 pt-4">
                <div class="row justify-content-center my-auto">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="text-center mb-4">
                            <a href="index.php">
                                <img src="../assets/image/favicon.png" alt="" height="22"> <span
                                    class="logo-txt">{{ config('app.name') }}</span>
                            </a>
                        </div>

                        <div class="card">
                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Welcome Back !</h5>
                                    <p class="text-muted">Sign in to continue to {{ config('app.name') }}.</p>
                                </div>
                                <div class="p-2 mt-4">

                                    {{ Form::open(['route' => 'login.post']) }}
                                    @csrf
                                    <div class="form-group mb-3">
                                        {{ Form::label('email', 'Email Address:', ['label' => 'email-label']) }}
                                        {{ Form::email('email', '', ['class' => 'form-control', 'placeholder' => 'Enter email', 'id' => 'email-field']) }}
                                        
                                        @error('email')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        {{ Form::label('password', 'Password:', ['label' => 'password-label']) }}
                                        {{ Form::password('password', ['class' => 'form-control', 'placeholder' => 'Enter password', 'id' => 'password-field']) }}
                                    </div>
                                    <div class="form-group">
                                        {{ Form::submit('Login', ['class' => 'btn btn-primary']) }}
                                    </div>
                                    {{ Form::close() }}

                                    <div class="mt-4 text-center">
                                        <p class="mb-0">Branch <a href="../branch/login.php"
                                                class="fw-medium text-primary"> Login</a> </p>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- end col -->
                </div><!-- end row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center text-muted p-4">
                            <p class="text-white-50">©
                                © 2024 All India Computer Trainer Association All Rights Reserved.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- end container -->
    </div>
    <!-- end authentication section -->
</body>

</html>
