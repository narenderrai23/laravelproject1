@extends('backend.admin.layouts.app')
@section('title', 'Add Students - Admin')
@section('nav', 'Add Students')
@push('scripts')
    <!-- choices css -->
    <link href="../assets/libs/choices.js/public/assets/styles/choices.min.css" rel="stylesheet" type="text/css" />
    <!-- datepicker css -->
    <link rel="stylesheet" href="../assets/libs/flatpickr/flatpickr.min.css">
@endpush
@section('main')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    {!! Form::open([
                        'route' => 'students.store',
                        'method' => 'POST',
                        'id' => 'addForm',
                        'class' => 'needs-validation',
                    ]) !!}
                    <div class="row">
                        <div class="col-sm-12 headinginfo h4 py-3 my-4">1. Branch/student Details</div>
                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('date_admission', 'Date Of Admission', ['class' => 'form-label']) !!}
                            {!! Form::text('date_admission', null, [
                                'class' => 'form-control',
                                'id' => 'datepicker',
                                'placeholder' => 'Please select Date Time',
                                'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('branch_id', 'Branch', ['class' => 'form-label']) !!}
                            {!! Form::select('branch_id', $branches->pluck('name', 'id'), null, [
                                'class' => 'form-select',
                                'id' => 'branch_id',
                                'required',
                                'placeholder' => 'Select Branch',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('code', 'Branch Code') !!}
                            {!! Form::text('code', null, ['class' => 'form-control', 'id' => 'code', 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 headinginfo h4 py-3 my-4">1. Course Details</div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('course_id', 'Course', ['class' => 'form-label']) !!}
                            {!! Form::select('course_id', $course->pluck('code', 'id'), null, [
                                'class' => 'form-select',
                                'id' => 'course_id',
                                'required',
                                'placeholder' => 'Select Branch',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('course_code', 'Course Code') !!}
                            {!! Form::text('course_name', null, ['class' => 'form-control', 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('cduration', 'Course Duration') !!}
                            {!! Form::text('cduration', null, ['class' => 'form-control', 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('total_fee', 'Course Fee') !!}
                            {!! Form::text('total_fee', null, ['class' => 'form-control', 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('course_type', 'Course Type') !!}
                            {!! Form::text('course_type', null, ['class' => 'form-control', 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('eligibility', 'Eligibility *') !!}
                            {!! Form::text('eligibility', null, ['class' => 'form-control', 'readonly' => 'readonly']) !!}
                        </div>

                        <div class="col-sm-12 headinginfo h4 py-3 my-4">2. Basic Information</div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('name', 'Student Name *') !!}
                            {!! Form::text('name', null, [
                                'class' => 'form-control',
                                'placeholder' => 'Student Name',
                                'required' => 'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('father_name', 'Father"s Name *') !!}
                            {!! Form::text('father_name', null, [
                                'class' => 'form-control',
                                'placeholder' => "Father's Name",
                                'required' => 'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('father_occupation', 'Father"s Occupation *') !!}
                            {!! Form::text('father_occupation', null, ['class' => 'form-control', 'placeholder' => "Father's Occupation"]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('student_dob', 'Date of Birth (dd/mm/YYYY) *') !!}
                            {!! Form::text('student_dob', null, [
                                'class' => 'form-control',
                                'placeholder' => 'Please select Date Time',
                                'id' => 'dob',
                                'required' => 'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('phone', 'Mobile Numbe *') !!}
                            {!! Form::text('phone', null, [
                                'class' => 'form-control valid',
                                'maxlength' => '10',
                                'placeholder' => 'Mobile Number',
                                'required' => 'required',
                                'oninput' => "this.value = this.value.replace(/[^0-9]/g, '');",
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('gender', 'Gender') !!}
                            <div class="my-2">
                                <label class="form-check form-check-inline">
                                    {!! Form::radio('gender', 'Male', true, ['class' => 'form-check-input']) !!} Male
                                </label>
                                <label class="form-check form-check-inline">
                                    {!! Form::radio('gender', 'Female', false, ['class' => 'form-check-input']) !!} Female
                                </label>
                                <label class="form-check form-check-inline">
                                    {!! Form::radio('gender', 'Transgender', false, ['class' => 'form-check-input']) !!} Transgender
                                </label>
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3 mb-3 mt-3">
                            {!! Form::label('profile_image', 'Upload Photo *') !!}
                            {!! Form::file('profile_image', [
                                'class' => 'form-control',
                                'id' => 'profile_image',
                                'accept' => 'image/*',
                                'required' => 'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            <div class="row">
                                <div class="col-sm-7" id="spreview">
                                    <img src="" alt="Preview"
                                        style="max-width: 150px; max-height: 150px; display: none;" id="imagePreview">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 headinginfo h4 py-3 my-4">3. Contact Information</div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('address1', 'Address (Line1) *') !!}
                            {!! Form::text('address1', null, [
                                'class' => 'form-control',
                                'placeholder' => 'Address (Line1)',
                                'required' => 'required',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('address2', 'Address (Line2) *') !!}
                            {!! Form::text('address2', null, [
                                'class' => 'form-control',
                                'placeholder' => 'Address (Line2)',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('state_id', 'State', ['class' => 'form-label']) !!}
                            {!! Form::select('state_id', $states->pluck('name', 'id'), null, [
                                'class' => 'form-select',
                                'id' => 'state_id',
                                'required',
                                'placeholder' => 'Select Branch',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('district_id', 'District', ['class' => 'form-label']) !!}
                            {!! Form::select('district_id', [], null, [
                                'class' => 'form-select',
                                'id' => 'district_id',
                                'required',
                                'placeholder' => 'Select District',
                            ]) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('email', 'Email *') !!}
                            {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Email']) !!}
                        </div>

                        <div class="col-sm-12 col-md-4 mb-3">
                            {!! Form::label('wphone', 'Whatsapp Numbe *') !!}
                            {!! Form::text('wphone', null, [
                                'class' => 'form-control valid',
                                'maxlength' => '10',
                                'placeholder' => 'Whatsapp Number',
                                'required' => 'required',
                                'oninput' => "this.value = this.value.replace(/[^0-9]/g, '');",
                            ]) !!}
                        </div>

                        <div class="col-sm-12 headinginfo h4 py-3 my-4">4. Educational Qualification</div>

                        <div class="row mb-3">
                            <div class="col-3">
                                {!! Form::label('qualification', 'Education', ['class' => 'form-label']) !!}
                                {!! Form::select('qualification', $level->pluck('name', 'id'), null, [
                                    'class' => 'form-select',
                                    'placeholder' => 'Select Education',
                                ]) !!}
                            </div>

                            <div class="col-3">
                                {!! Form::label('board_university', 'Board/University') !!}
                                {!! Form::text('board_university', null, ['class' => 'form-control', 'placeholder' => 'Board/University']) !!}
                            </div>
                            <div class="col-3">
                                {!! Form::label('year_of_passing', 'Year of Passing') !!}
                                {!! Form::number('year_of_passing', null, [
                                    'class' => 'form-control',
                                    'placeholder' => 'Year of Passing',
                                    'max' => now()->format('Y'),
                                ]) !!}
                            </div>
                            <div class="col-3">
                                {!! Form::label('percentage', 'Percentage (%)') !!}
                                {!! Form::number('percentage', null, [
                                    'class' => 'form-control',
                                    'placeholder' => 'Percentage (%)',
                                    'max' => '100',
                                ]) !!}
                            </div>
                        </div>

                        <div class="col-sm-12">
                            {!! Form::label('pqualification', 'Professional Qualification') !!}
                            {!! Form::text('pqualification', null, [
                                'class' => 'form-control',
                                'placeholder' => 'Professional Qualification',
                            ]) !!}
                        </div>

                    </div>
                    <div class="d-flex align-items-start gap-3 mt-4">
                        {!! Form::submit('Submit', ['class' => 'btn btn-primary w-sm ms-auto', 'name' => 'addbtn']) !!}
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div><!-- end col -->
    </div><!-- end row -->
@endsection

@push('scripts')
    <script src="../assets/libs/flatpickr/flatpickr.min.js"></script>
    <script src="../assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <script>
        function SelectOption(response, select_dropdown, selectedCityName) {
            select_dropdown.empty().append($("<option>").text("Select").val(""));
            $.each(response, function(key, value) {
                select_dropdown.append(
                    $("<option>").text(value[selectedCityName]).val(value.id)
                );
            });
        }


        $("#state_id").change(function() {
            var stateId = $(this).val();
            makeAjaxRequest(
                'students/district/' + stateId,
                function(response) {
                    SelectOption(response, $('[name="district_id"]'), "name");
                }
            );
        });

        $('#branch_id').change(function() {
            const cityId = $(this).val();
            makeAjaxRequest(
                'students/branch-code/' + cityId,
                function(response) {
                    $('#code').val(response.code);
                }
            );
        });

        function makeAjaxRequest(url, successCallback, errorCallback) {
            return $.ajax({
                url: url,
                type: 'GET',
                success: successCallback,
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }


        $('#course_id').change(function() {
            var CourseId = $(this).val();
            makeAjaxRequest(
                'students/course-code/' + CourseId,
                function(response) {
                    $('[name="course_name"]').val(response.name);
                    $('[name="cduration"]').val(`${response.course_duration} ${response.duration_time}`);
                    $('[name="total_fee"]').val(response.total_fee);
                    $('[name="course_type"]').val(response.course_type);
                    $('[name="eligibility"]').val(response.eligibility);
                }
            );
        });

        flatpickr('#datepicker', {
            maxDate: 'today',
            defaultDate: 'today',
        });

        $("#dob").flatpickr({
            dateFormat: "Y-m-d",
            maxDate: 'today',
            defaultDate: '2002-06-28',
        });

        $("#profile_image").on("change", function() {
            if (this.files && this.files[0]) {
                const reader = new FileReader();
                reader.onload = (e) =>
                    $("#imagePreview").attr("src", e.target.result).show();
                reader.readAsDataURL(this.files[0]);
            }
        });

        new Choices("#branch_id");
        new Choices("#course_id");
        new Choices("#state_id");
        new Choices("#qualification");
    </script>
@endpush