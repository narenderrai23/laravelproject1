<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="index" class="logo logo-dark text-center">
            <span class="logo-sm">
                <img src="../assets/image/logo.gif" alt="{{ config('app.name') }} LOGO" height="22">
            </span>
            <span class="logo-lg">
                <img src="../assets/image/logo.gif" alt="{{ config('app.name') }} LOGO" class="w-50">
            </span>
        </a>

        <a href="index" class="logo logo-light text-center">
            <span class="logo-lg">
                <img src="../assets/image/logo.gif" alt="{{ config('app.name') }} LOGO" class="w-50">
            </span>
            <span class="logo-sm">
                <img src="../assets/image/favicon.png" alt="{{ config('app.name') }} LOGO" height="22">
            </span>
        </a>
    </div>

    <button type="button" class="btn btn-sm px-3 font-size-16 header-item vertical-menu-btn">
        <i class="fa fa-fw fa-bars"></i>
    </button>

    <div data-simplebar class="sidebar-menu-scroll">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu">Menu</li>

                <li>
                    <a href="index">
                        <i class="bx bx-tachometer icon nav-icon"></i>
                        <span class="menu-item" data-key="t-dashboards">Dashboard</span>
                    </a>
                </li>

                <li class="menu-title" data-key="t-applications">Applications</li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i class="bx bx bx-user icon nav-icon"></i>
                        <span class="menu-item" data-key="t-student">Student</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="students" data-key="students">Add Student</a></li>
                        <li><a href="students" data-key="edit-students">Manage Student</a></li>
                        <li><a href="filter-students" data-key="students-excel">Excel Student</a></li>
                        <li><a href="students" data-key="students-excel">Filter Student</a></li>
                        <li><a href="students-completed" data-key="students-excel">Completed Student</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i class="fas fa-school icon nav-icon"></i>
                        <span class="menu-item" data-key="t-branch">Branch</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="branches" data-key="branches">Branch</a></li>
                        <li><a href="filter-branch" data-key="branch-excel">Branch Excel</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i class="bx bxs-city icon nav-icon"></i>
                        <span class="menu-item" data-key="t-branch">City</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="cities" data-key="cities">Cities</a></li>
                        <li><a href="states" data-key="states">States</a></li>
                        <li><a href="districts" data-key="districts">District</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i class="bx bx-book-open icon nav-icon"></i>
                        <span class="menu-item" data-key="t-course">Course</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="courses" data-key="courses">Course</a></li>
                        <li><a href="categories" data-key="categories">Category</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i class="bx bx-user-circle icon nav-icon"></i>
                        <span class="menu-item" data-key="t-course">Settings</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="profile" data-key="courses">Contacts Profile</a></li>
                        <li><a href="importer" data-key="importer">Importer</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
