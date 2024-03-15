@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'Courses')
@push('links')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <!-- choices css -->
    <link href="{{ asset('assets/libs/choices.js/public/assets/styles/choices.min.css') }}" rel="stylesheet" type="text/css" />
@endpush
@section('main')
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title" style="text-align: center;">Add Course</h4>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
                        Add Course
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
                    <h5 class="modal-title" id="addLabel">Add City</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addForm" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="category_id">State:</label>
                                <select class="form-select" name="category_id" required>
                                    <option value="">Select State</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>

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
                        <button type="submit" class="btn btn-primary">Create City</button>
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
                            <div class="col-md-6 mb-3">
                                <label for="category_id">State:</label>
                                <select class="form-select" name="category_id" required>
                                    <option value="">Select State</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>

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
    <script src="{{ asset('assets/libs/choices.js/public/assets/scripts/choices.min.js') }}"></script>

    <script>
        $(document).ready(function() {
            const table = initializeDataTable('#table');
        });

        initializeDataTable = (tableId) => {
            return $(tableId).DataTable({
                processing: true,
                serverSide: true,
                ajax: `{{ route('courses.datatables') }}`,
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
                        data: 'total_fee',
                    },
                    {
                        data: 'course_duration',
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


        $("#addForm").submit(function(e) {
            e.preventDefault();
            const data = new FormData(this);
            $.ajax({
                type: "POST",
                url: "{{ route('courses.store') }}",
                data: data,
                processData: false,
                contentType: false,
                success: function(data) {
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
            const categoryId = $("#id").val();
            const formData = new FormData(this);
            $.ajax({
                url: 'courses/' + categoryId,
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

        function getCourse(categoryId) {
            $.ajax({
                url: 'courses/' + categoryId,
                type: 'GET',
                success: function(response) {
                    console.log(response);
                    $('#edit').modal('show');
                    $('[name="id"]').val(response.id);
                    $('[name="name"]').val(response.name);
                    $('[name="code"]').val(response.code);
                    $('[name="category_id"]').val(response.category_id);
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

        function deleteCourse(categoryId) {
            $.ajax({
                url: 'courses/' + categoryId,
                type: 'DELETE',
                success: function(response) {
                    if (response.status) {
                        $('#row_' + categoryId).closest('tr').remove();
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }
    </script>
@endpush
