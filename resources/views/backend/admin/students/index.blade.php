@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'Students')
@push('links')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- alertifyjs Css -->
    <!-- alertifyjs Css -->
    <link href="{{ asset('assets/libs/alertifyjs/build/css/alertify.min.css') }}" rel="stylesheet" type="text/css" />
    <!-- alertifyjs default themes  Css -->
    <link href="{{ asset('assets/libs/alertifyjs/build/css/themes/default.min.css') }}" rel="stylesheet" type="text/css" />

    <link href="{{ asset('assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
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
        @if (session()->has('status'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session()->get('message') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            {{ session()->forget('status', 'message') }}
        @endif

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4 class="card-title" style="text-align: center;">Add Student</h4>
                    <a href="{{ route('students.create') }}" class="btn btn-primary">
                        Add Student
                    </a>
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
    <script src="{{ asset('assets/libs/alertifyjs/build/alertify.min.js') }}"></script>

    <!-- Sweet Alerts js -->
    <script src="{{ asset('assets/libs/sweetalert2/sweetalert2.min.js') }}"></script>
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
                search: {
                    "regex": true
                },
                drawCallback: setupDrawCallback,
            });
        }

        function getColumns() {
            const baseColumns = [{
                    data: "id"
                },
                {
                    data: "enrollment"
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
                    data: 'approve'
                },
                {
                    data: 'action',
                },
                {
                    data: 'student_status',
                },
            ];
            return baseColumns;
        }

        function deleteStudent(stateId) {
            const url = "{{ route('students.destroy', ':stateId') }}".replace(':stateId', stateId);
            $.ajax({
                url: url,
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

        function makeAjaxRequest(url, successCallback) {
            return $.ajax({
                url: url,
                type: 'GET',
                success: successCallback,
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
                };

                const success = function(response) {
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

                const url = "{{ route('students.student-status', ':id') }}".replace(':id', id);
                performAjaxRequest(url, data, success);
            });
        }

        function performAjaxRequest(url, data, success) {
            $.ajax({
                url: url,
                method: "POST",
                data: data,
                dataType: "json",
                success: success,
                error: function(xhr, status, error) {
                    console.error("Error occurred during the operation:", xhr.responseText);
                },
            });
        }

        function processApproval($element) {
            const itemId = $element.data("id");
            Swal.fire({
                title: "Processing: Please Approve Student",
                html: '<button class="btn btn-sm btn-success">This process is in progress.</button>',
                didOpen: function() {
                    Swal.showLoading();
                    timerInterval = setInterval(function() {
                        var content = Swal.getHtmlContainer();
                        if (content) {
                            var b = content.querySelector("b");
                            if (b) {
                                b.textContent = Swal.getTimerLeft();
                            }
                        }
                    }, 100);
                },
            });

            const url = "{{ route('students.approve', ':itemId') }}".replace(':itemId', itemId);
            makeAjaxRequest(url, function(response) {
                console.log(response);
                Swal.close();
                if (response.status === true) {
                    $("#row" + itemId).text(response.enrollment);
                    const $icon = $element.find("i");
                    $element.removeClass("bg-danger").addClass("bg-success");
                    $icon.removeClass("bx-x").addClass("bx-badge-check");
                } else {
                    alert(response.message);
                }
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
