@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'index')
@push('scripts')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
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
                    <h5 class="modal-title" id="addLabel">Add</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addForm" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="name" class="form-label">{{ __('Name') }}</label>
                            <input type="text" class="form-control" id="name" name="name" required autofocus
                                autocomplete="name">
                            @error('name')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">{{ __('Save') }}</button>

                        @if (session('status') === 'profile-updated')
                            <p class="text-success">{{ __('Saved.') }}</p>
                        @endif
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
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="stname" name="name">
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
    <script>
        $(document).ready(function() {
            var table = initializeDataTable('#table');

            $('#updateForm').submit(function(e) {
                e.preventDefault();
                var stateId = $("#id").val();
                const formData = new FormData(this);
                $.ajax({
                    url: 'states/' + stateId,
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        if (response.status) {
                            $('#edit').modal('hide');
                            $('#table').DataTable().ajax.reload();
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            });
        });

        $("#addForm").submit(function(e) {
            e.preventDefault();
            const data = new FormData(this);
            $.ajax({
                type: "POST",
                url: "{{ route('states.store') }}",
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

        function initializeDataTable(tableId) {
            return $(tableId).DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('states.datatables') }}',
                columns: [{
                        data: 'id',
                    },
                    {
                        data: 'name',
                    },
                    {
                        data: 'created_at',
                    },
                    {
                        data: 'action',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
        }

        function getState(stateId) {
            $.ajax({
                url: 'states/' + stateId,
                type: 'GET',
                success: function(response) {
                    $('#edit').modal('show');
                    $('#id').val(response.id);
                    $('#stname').val(response.name);
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }

        function deleteState(stateId) {
            $.ajax({
                url: 'states/' + stateId,
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
