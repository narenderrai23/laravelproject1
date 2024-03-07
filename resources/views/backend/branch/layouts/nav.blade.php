<header class="header header-style-02 header-sticky">
    <div class="header-main py-lg-4">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="d-lg-flex align-items-center">
                        <!-- logo -->
                        <a class="navbar-brand logo text-lg-center" href="{{ asset('branch/index') }}">
                            <img src="{{ asset('branch/images/logo.svg') }}" alt="Logo">
                        </a>
                        <!-- header contact info -->
                        <div class="header-contact-info ml-auto justify-content-center d-none d-lg-flex">
                            <div class="d-flex mr-3">
                                <i class="fa fa-phone fa-flip-horizontal fa-fw align-self-center"></i>
                                <div class="align-self-center">
                                    <span class="d-block font-weight-bold mb-1 text-dark">Call Now</span>
                                    <span>(+112) 7890 654 123</span>
                                </div>
                            </div>
                            <div class="d-flex mr-3 mb-1 mb-lg-0">
                                <i class="far fa-envelope fa-fw align-self-center"></i>
                                <div class="align-self-center">
                                    <span class="d-block font-weight-bold mb-1 text-dark">Send Message</span>
                                    <span>support@academic.com</span>
                                </div>
                            </div>
                            <div class="d-flex mb-1 mb-lg-0">
                                <i class="fas fa-map-marker-alt fa-fw align-self-center"></i>
                                <div class="align-self-center">
                                    <span class="d-block font-weight-bold mb-1 text-dark">Our Location</span>
                                    <span>721 Bedford Court</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-menu bg-light">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <nav class="navbar navbar-expand-lg">
                        <!-- Sticky logo -->
                        <a class="navbar-brand logo-sticky" href="{{ asset('branch/index') }}">
                            <img src="{{ asset('branch/images/logo.svg') }}" alt="Logo">
                        </a>
                        <!-- Navbar toggler START-->
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- Navbar toggler END-->

                        <!-- Navbar START -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown active">
                                    <a class="nav-link" href="#" role="button">Home</a>

                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" role="button">Course</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link  dropdown-toggle" href="#" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Event<i
                                            class="fas fa-chevron-down fa-xs"></i>
                                    </a>
                                    <!-- Dropdown Menu -->
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="{{ asset('branch/events-list') }}">Events
                                                List</a></li>
                                        <li><a class="dropdown-item" href="{{ asset('branch/events-grid') }}">Events
                                                Grid</a></li>
                                        <li><a class="dropdown-item" href="{{ asset('branch/event-detail') }}">Event
                                                Detail</a>
                                        </li>
                                    </ul>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="{{ asset('branch/contact-us') }}">Contact Us</a>
                                </li>
                            </ul>
                        </div>
                        <!-- Navbar END-->

                        <div class="mr-5 mr-lg-0 d-sm-flex d-none align-items-center">
                            <!-- Button START-->
                            <a class="btn btn-dark" href="#">Get a Quote</a>
                            <!-- Button END-->
                        </div>

                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
