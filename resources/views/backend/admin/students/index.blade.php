@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'index')
@push('links')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endpush
@push('styles')
    <style>
        .select2 {
            text-transform: capitalize;
        }

        .select2-container--default.select2-container--disabled .select2-selection--single,
        .select2-container--default .select2-selection--single {
            background-color: transparent;
            border: 0;
            border-radius: 0;
        }

        .select2-selection__arrow {
            height: 30px !important;
        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            width: 105px;
            padding: 0;
        }
    </style>
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
                                <th>S.No</th>
                                <th>Enrollment No</th>
                                <th>Student Name</th>
                                <th>Father's Name</th>
                                <th>Course</th>
                                <th>Branch Name</th>
                                <th>Admission Date</th>
                                <th>Approve</th>
                                <th>Action</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="../assets/libs/alertifyjs/build/alertify.min.js"></script>

    <!-- Sweet Alerts js -->
    <script src="../assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script>
        $(document).ready(function() {
            var table = initializeDataTable('#table');
        });

        function initializeDataTable(tableId) {
            return $(tableId).DataTable({
                processing: true,
                serverSide: true,
                pageLength: 50,
                order: [0, "desc"],
                columnDefs: [{
                        targets: [3, 6],
                        visible: false
                    },
                    {
                        targets: [7, 8, 9],
                        orderable: false
                    },
                ],
                ajax: '{{ route('students.datatables') }}',
                columns: getColumns(),
                drawCallback: setupDrawCallback,
            });
        }

        function getColumns() {
            const baseColumns = [{
                    data: "id"
                },
                {
                    data: 'enrollment',
                },
                {
                    data: "name"
                },
                {
                    data: "father_name"
                },
                {
                    data: "course_code"
                },
                {
                    data: "branch_name"
                },
                {
                    data: 'date_admission',
                },
                {
                    render: renderApprovalColumn
                },
                // {
                //     render: renderButtonGroupColumn
                // },
                {
                    data: 'action',
                },
                {
                    render: renderStudentStatusColumn
                },
            ];
            return baseColumns;
        }

        function renderButtonGroupColumn(data, type, row) {
            return '<div class="btn-group btn-group-sm">' +
                '<a class="btn btn-success" href="edit-student.php?id=' + row.id + '">' +
                '<i class="font-size-10 fas fa-user-edit"></i>' +
                '</a>' +
                '<button class="btn btn-danger delete" data-id="' + row.id + '">' +
                '<i class="font-size-10 far fa-trash-alt"></i>' +
                '</button>' +
                '<a class="btn btn-info" href="details-student.php?id=' + row.id + '">' +
                '<i class="font-size-10 fas fa-eye"></i>' +
                '</a>' +
                '<button class="btn btn-primary cartificate" onclick="edit(\'' + row.enrollment + '\')">' +
                '<i class="font-size-10 fas fa-certificate"></i>' +
                '</button>' +
                '</div>';
        }

        function renderApprovalColumn(data, type, row) {
            return '<button class="text-uppercase badge fs-6 border-0 bg-' + (row.approve === "yes" ? "success" :
                    "danger") + ' approve" data-id="' + row.id + '" ' + (row.approve === "yes" ? "disabled" : "") + '>' +
                '<i class="bx bx-' + (row.approve === "yes" ? "badge-check" : "x") + '"></i>' +
                '</button>';
        }

        function renderStudentStatusColumn(data, type, row) {
            var selectElement = $(
                '<select class="form-select form-select-sm student_status select2 dropdown-toggle"></select>').attr(
                'data-id', row.id);
            var options = {
                'complete': 'Completed',
                'running': 'Running',
                'dropout': 'Drop Out'
            };

            $.each(options, function(value, text) {
                var option = $('<option></option>').val(value).text(text);
                if (row.student_status === value) {
                    option.attr('selected', 'selected').attr('disabled', 'disabled');
                }
                selectElement.append(option);
            });

            return selectElement.prop('outerHTML');
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

        function setupDrawCallback(settings) {
            const classes = {
                complete: "btn-soft-success w-100 pe-3 text-start",
                running: "btn-soft-info w-100 pe-3 text-start",
                dropout: "btn-soft-danger w-100 pe-3 text-start",
            };

            initializeCustomSelect2(".select2", classes);

            $(".approve").click(function() {
                processApproval($(this));
            });

            $(".student_status").on("change", function() {
                const id = $(this).data("id");
                const value = $(this).val();
                const classes = {
                    complete: "text-success",
                    running: "text-info",
                    dropout: "text-danger",
                };
                console.log(id);

                var currentClasses = Object.values(classes).join(" ");
                if ($(this).hasClass(currentClasses)) {
                    $(this).removeClass(currentClasses);
                }
                var newClass = classes[value];
                if (newClass) {
                    $(this).addClass(newClass);
                    $(this).children().prop("disabled", false);
                    $(this).find(":selected").prop("disabled", true);
                }
                const data = {
                    id: id,
                    status: value,
                    action: "updateStudentStatus",
                };

                const success = function(response) {
                    console.log(response);
                    if (response.status === true) {
                        const classes = {
                            complete: " bg-success text-light",
                            running: " bg-info text-light",
                            dropout: " bg-danger text-light",
                        };
                        const currentClasses = classes[response.color] ?? "success";
                        alertify.set("notifier", "position", "top-right");
                        alertify.notify(response.message, currentClasses, 3);
                    }
                };
                const url = "../php/controller/studentController.php";
                performAjaxRequest(url, data, success);
            });
        }

        function initializeCustomSelect2(selector, classes) {
            $(selector).select2({
                width: "auto",
                minimumResultsForSearch: -1,
                templateSelection: function(data) {
                    if (!data.id) {
                        return data.text;
                    }
                    var colorClass = classes[data.id] || "text-default";
                    return $(
                        '<span class="btn btn-sm ' + colorClass + '">' + data.text + "</span>"
                    );
                },
            });
        }
    </script>
@endpush
