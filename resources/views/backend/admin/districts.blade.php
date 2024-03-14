@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'index')
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
                    <h4 class="card-title" style="text-align: center;">Add State</h4>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add">
                        Add State
                    </button>
                </div>
                <div class="card-body">
                    <table id="table" class="table table-hover table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>State</th>
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
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">Add City</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addForm" method="POST">
                        @csrf
                        <div class="form-group mb-3">
                            <label for="state_id">State:</label>
                            <select class="form-select" name="state_id" required>
                                <option value="">Select State</option>
                                @foreach ($states as $state)
                                    <option value="{{ $state->id }}">{{ $state->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" name="name" required autofocus>
                        </div>

                        <button type="submit" class="btn btn-primary">Create City</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!-- Update  Modal -->
    <div class="modal fade" id="edit">
        <div class="modal-dialog">
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
                        <div class="form-group mb-3">
                            <label for="state_id">State:</label>
                            <select class="form-select" id="state_id" name="state_id" required>
                                <option value="">Select State</option>
                                @foreach ($states as $state)
                                    <option value="{{ $state->id }}">{{ $state->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required autofocus>
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
                ajax: `{{ route('districts.datatables') }}`,
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'sname',
                        name: 'sname'
                    },
                    {
                        data: 'created_at',
                        name: 'created_at'
                    },
                    {
                        data: 'action',
                        name: 'action',
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
                url: "{{ route('districts.store') }}",
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
            const stateId = $("#id").val();
            const formData = new FormData(this);
            $.ajax({
                url: 'districts/' + stateId,
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

        function getDistrict(stateId) {
            $.ajax({
                url: 'districts/' + stateId,
                type: 'GET',
                success: function(response) {
                    console.log(response);
                    $('#edit').modal('show');
                    $('[name="state_id"]').val(response.state_id);
                    $('[name="id"]').val(response.id);
                    $('[name="name"]').val(response.name);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        function deleteDistrict(stateId) {
            $.ajax({
                url: 'districts/' + stateId,
                type: 'DELETE',
                success: function(response) {
                    if (response.status) {
                        $('#row_' + stateId).closest('tr').remove();
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }
    </script>
@endpush
