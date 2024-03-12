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
                                <select class="form-select state" required>
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
                                <label for="city_id">City:</label>
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
                                <select name="category" class="form-select select2" required>
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
                                        <input type="date" name="joining_date" placeholder="2024-02-20"
                                            class="form-control date" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Valid Till
                                            Date</label>
                                        <input type="text" class="form-control till_date" placeholder="Valid Till Date"
                                            disabled>
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
                                        <input type="password" class="form-control" name="password" required>
                                        <span class="btn btn-success input-group-text password-eye"><i
                                                class="fas fa-eye"></i></span>
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
                            <div class="col-lg-4 mb-4">
                                <label for="state">State</label>
                                <select class="form-select state select2" id="state_id" required>
                                    <option selected disabled>Select State</option>
                                    @foreach ($states as $state)
                                        <option value="{{ $state->id }}">{{ $state->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label for="city_id">State:</label>
                                <select class="form-select" name="city_id" required>
                                </select>
                            </div>

                            <div class="col-lg-4 mb-4">
                                <label>Branch Code</label>
                                <input type="text" id="code" class="form-control" required readonly>
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
                                <select name="category" class="form-select select2" required>
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
                                        <input type="date" name="joining_date" placeholder="2024-02-20"
                                            class="form-control date" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Valid Till
                                            Date</label>
                                        <input type="text" class="form-control till_date"
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
                                        <input type="password" class="form-control" name="password" id="password">
                                        <span class="btn btn-success input-group-text password-eye"><i
                                                class="fas fa-eye"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Branch</button>
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

            $('.date').on('change', function() {
                var joinDate = new Date($(this).val());
                var validTillDate = new Date(joinDate.getFullYear() + 3, joinDate.getMonth(), joinDate
                    .getDate());
                var formattedDate = validTillDate.toISOString().split('T')[0];
                $('.till_date').val(formattedDate);
            });

            flatpickr('.date', {
                minDate: "today",
            });

            new Choices(".select2");

            $(".state").change(function() {
                var stateId = $(this).val();
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
                url: 'branches/fetch-city/' + stateId,
                type: 'GET',
                success: function(response) {
                    SelectOption(response, $('[name="city_id"]'), "name");
                    $('[name="city_id"]').val(selected);
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

        function getBranch(cityId) {
            $.ajax({
                url: 'branches/' + cityId,
                type: 'GET',
                success: function(response) {
                    console.log(response);
                    $('#edit').modal('show');
                    var updateForm = $("#updateForm");
                    updateForm.find('#edit').modal('show');
                    var fields = ["id", "name", "phone", "head", "joining_date", "address", "c_address",
                        "email", "category"
                    ];
                    fields.forEach(function(field) {
                        updateForm.find('[name="' + field + '"]').val(response[field]);
                    });
                    updateForm.find('#state_id').val(response.state_id);
                    updateForm.find('#code').val(response.code);
                    updateForm.find('.till_date').val(response.till_date);

                    fetchCity(response.state_id, response.city_id);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        function deleteBranch(cityId) {
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
