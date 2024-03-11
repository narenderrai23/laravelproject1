@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'Courses')
@push('scripts')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <!-- choices css -->
    <link href="../assets/libs/choices.js/public/assets/styles/choices.min.css" rel="stylesheet" type="text/css" />
    <!-- datepicker css -->
    <link rel="stylesheet" href="../assets/libs/flatpickr/flatpickr.min.css">
@endpush
@section('main')
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title" style="text-align: center;">Add branches</h4>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
                        Add branches
                    </button>
                </div>
                <div class="card-body">
                    <table id="table" class="table table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Fee</th>
                                <th>Course Duration</th>
                                <th>Created</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <!-- Create  Modal -->
    <div class="modal fade" id="add">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">Add Branch</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addForm" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-lg-4 mb-4">
                                <label for="state">State</label>
                                <select name="state" class="form-select state" required id="state">
                                    <option selected disabled>Select State</option>
                                    @foreach ($states as $state)
                                        <option value="{{ $state->id }}">{{ $state->name }}</option>
                                    @endforeach
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a valid state.
                                </div>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label for="city_id">State:</label>
                                <select class="form-select" name="city_id" required>
                                </select>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Branch Code</label>
                                <input type="text" name="code" class="form-control" required readonly>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Branch Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Branch Head</label>
                                <input type="text" name="head" class="form-control" required>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Branch Category</label>
                                <select name="category" id="category" class="form-control select2" required>
                                    <option value="authorized">Authorized</option>
                                    <option value="training">Training</option>
                                    <option value="learning">Learning</option>
                                </select>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Mobile</label>
                                <input type="text" name="phone" class="form-control valid" required maxlength="10"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                            </div>

                            <div class="col-lg-8 mb-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="form-label" for="date">Joining Date</label>
                                        <input type="date" name="joining_date" placeholder="2024-02-20" id="date"
                                            class="form-control" required>
                                        <div class="invalid-feedback">
                                            Please provide a valid city.
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label" for="till_date">Valid Till
                                            Date</label>
                                        <input type="text" class="form-control" id="till_date"
                                            placeholder="Valid Till Date" disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Address</label>
                                <textarea name="address" class="form-control" rows="2" required></textarea>

                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Corresponding Address</label>
                                <textarea name="c_address" class="form-control" rows="2" required></textarea>
                            </div>

                            <div class="row m-0 p-3 pb-2 mb-4 bg-dark text-light">
                                <div class="col-3 align-self-center">
                                    <span class="fs-4 fw-bold text-capitalize">Login details</span>
                                </div>

                                <div class="col">
                                    <label>Email</label>
                                    <input type="email" name="email" class="form-control" required>
                                </div>

                                <div class="col">
                                    <label for="password">Password</label>
                                    <div class="input-group mb-3">
                                        <input type="password" class="form-control" name="password" id="password"
                                            required>
                                        <span class="btn btn-success input-group-text password-eye"><i class="fas fa-eye"></i></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <button type="submit" class="btn btn-primary">Create Branch</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!-- Update  Modal -->
    <div class="modal fade" id="edit">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="updateForm" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="id" id="id">
                        <div class="row">
                            {{-- <div class="col-md-6 mb-3">
                                <label for="city_id">State:</label>
                                <select class="form-select" name="city_id" required>
                                    <option value="">Select State</option>
                                    @foreach ($cities as $city)
                                        <option value="{{ $city->id }}">{{ $city->name }}</option>
                                    @endforeach
                                </select>
                            </div> --}}

                            <div class="col-md-6 mb-3">
                                <label for="basic-url">Course Duration <span class="redTxt">
                                        *</span></label>
                                <div class="input-group mb-3">
                                    <input class="form-control" type="number" id="cduration" maxlength="3"
                                        name="course_duration">
                                    <div class="input-group-prepend">
                                        <select class="form-select" id="durationtime" name="duration_time">
                                            <option value="Days">Days</option>
                                            <option value="Months">Months</option>
                                            <option value="Year">Year</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="shortnm">Course Code<span class="redTxt">*</span></label>
                                <input class="form-control" type="text" id="shortnm" name="code"
                                    style="text-transform: uppercase;" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <div class="">
                                    <label for="course_name">Course Name<span class="redTxt">*</span></label>
                                    <input class="form-control" type="text" id="course_name" name="name">
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="tfee">Total Fee ( ₹ )</label>
                                <input class="form-control" type="number" id="total_fee" name="total_fee"
                                    placeholder="( ₹ )">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="ctypemst">Course Type<span class="redTxt">*</span></label>
                                <select class="form-select" id="course_type" name="course_type">
                                    <option value="">Select Course Category</option>
                                    <option value="Career Programs">Career Programs</option>
                                    <option value="Professional Course">Professional Course</option>
                                    <option value="Short-Term Programs">Short-Term Programs</option>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="eligible">Eligibility</label>
                                <textarea id="eligible" class="form-control" name="eligibility" rows="3"></textarea>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="odetail">Other Details</label>
                                <textarea id="odetail" class="form-control" name="other_details" rows="3"></textarea>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <!-- choices js -->
    <script src="../assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
    <!-- datepicker js -->
    <script src="../assets/libs/flatpickr/flatpickr.min.js"></script>
    <script>
        $(document).ready(function() {
            const table = initializeDataTable('#table');

            $('#date').on('change', function() {
                var joinDate = new Date($(this).val());
                var validTillDate = new Date(joinDate.getFullYear() + 3, joinDate.getMonth(), joinDate
                    .getDate());
                var formattedDate = validTillDate.toISOString().split('T')[0];
                $('#till_date').val(formattedDate);
            });
            flatpickr('#date', {
                minDate: "today",
            });

            new Choices("#category");

            $("#state").change(function() {
                var stateId = $("#state").val();
                fetchCity(stateId);
            });


            $(".password-eye").on("click", function() {
                var passwordInput = $(this).siblings("input");
                var isPassword = passwordInput.attr("type") === "password";
                passwordInput.attr("type", isPassword ? "text" : "password");
                $(this).find("i").toggleClass("fa-eye fa-eye-slash");
            });

            $("#search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });

            $('[name="city_id"]').change(function() {
                var cityId = $(this).val();
                console.log(cityId);
                $.ajax({
                    url: 'branches/generate-branch-code/' + cityId,
                    type: 'GET',
                    success: function(response) {
                        $('[name="code"]').val(response);
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });


            $("#addForm").submit(function(e) {
                e.preventDefault();
                const data = new FormData(this);
                $.ajax({
                    type: "POST",
                    url: "{{ route('branches.store') }}",
                    data: data,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        console.log(response);
                        $('.modal').modal('hide');
                        $('#addForm').trigger("reset");
                        $('#table').DataTable().ajax.reload();
                    },
                    error: function(error) {
                        console.error(error);
                    }
                })
            });

            $('#updateForm').submit(function(e) {
                e.preventDefault();
                const cityId = $("#id").val();
                const formData = new FormData(this);
                $.ajax({
                    url: 'branches/' + cityId,
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        console.log(response);
                        if (response.status) {
                            $('.modal').modal('hide');
                            $('#table').DataTable().ajax.reload();
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            });
        });

        initializeDataTable = (tableId) => {
            return $(tableId).DataTable({
                processing: true,
                serverSide: true,
                ajax: `{{ route('branches.datatables') }}`,
                columns: [{
                        data: 'id',
                    },
                    {
                        data: 'code',
                    },
                    {
                        data: 'name',
                    },
                    {
                        data: 'head',
                    },
                    {
                        data: 'category',
                    },
                    {
                        data: 'created_at',
                    },
                    {
                        data: 'action',
                        orderable: false,
                        searchable: false,
                    },
                ],
            });
        };

        function fetchCity(stateId, selected = null) {
            $.ajax({
                url: 'branches/' + stateId,
                type: 'GET',
                success: function(response) {
                    console.log(response);
                    SelectOption(response, $('[name="city_id"]'), "name");
                    $("#city").val(selected);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        function SelectOption(response, select_dropdown, selectedCityName) {
            select_dropdown.empty().append($("<option>").text("Select").val(""));
            $.each(response, function(key, value) {
                select_dropdown.append(
                    $("<option>").text(value[selectedCityName]).val(value.id)
                );
            });
        }

        function getCourse(cityId) {
            $.ajax({
                url: 'branches/' + cityId,
                type: 'GET',
                success: function(response) {
                    console.log(response);
                    $('#edit').modal('show');
                    $('[name="id"]').val(response.id);
                    $('[name="name"]').val(response.name);
                    $('[name="code"]').val(response.code);
                    $('[name="city_id"]').val(response.city_id);
                    $('[name="course_duration"]').val(response.course_duration);
                    $('[name="duration_time"]').val(response.duration_time);
                    $('[name="total_fee"]').val(response.total_fee);
                    $('[name="eligibility"]').val(response.eligibility);
                    $('[name="other_details"]').val(response.other_details);
                    $('[name="course_type"]').val(response.course_type);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        function deleteCourse(cityId) {
            $.ajax({
                url: 'branches/' + cityId,
                type: 'DELETE',
                success: function(response) {
                    if (response.status) {
                        $('#row_' + cityId).closest('tr').remove();
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }
    </script>
@endpush
