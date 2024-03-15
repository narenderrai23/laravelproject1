@php
    $post = $mailData['post'];
    $branch = $mailData['branch'];
    $subject = $mailData['title'];
@endphp

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            color: #333;
        }

        header {
            background-color: #fff;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        table td strong {
            display: block;
        }

        .fw-bold {
            font-weight: bold;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <div class="container">
        <table style="width: 100%; text-align: center;">
            <tr>
                <td>
                    <img src="https://www.aicta.org.in/assets/image/logo.gif" alt="Logo"
                        style="max-width: 100%; width: 100px;height: 100px;" />
                </td>
                <td>
                    <h2 style="color: turquoise; font-size: 18px;">{{ $mailData['title'] }}</h2>
                </td>
            </tr>
        </table>

        <div style="text-align: center;margin-top:20px;margin-bottom:10px">
            <img src="{{ $post->profile_image }}" alt="Logo" style="width: 100px;height: 100px;">
        </div>';

        <h4 style="margin: 0px;line-height: 160%;text-align: center;word-wrap: break-word;">Hi
            <h1 class="v-font-size" style="margin: 0px;text-align: center; word-wrap: break-word;font-size: 33px;">
                <span>{{ $post->name }}</span>
            </h1>
            <div style="text-align: center; padding: 10px 0;">
            </div>
            <div>

                <h2 style="color: #333;">Student Information</h2>
                <table>
                    <tr>
                        <td class="fw-bold">Name:</td>
                        <td>{{ $post->name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Father Name:</td>
                        <td>{{ $post->father_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Course:</td>
                        <td>{{ $branch->course_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Student Phone:</td>
                        <td>{{ $post->phone }}</td>
                    </tr>

                    @if ($post->approved === 'yes')
                        <tr>
                            <td class="fw-bold">Enrollment:</td>
                            <td>{{ $enrollment }}</td>
                        </tr>
                    @endif

                    <tr>
                        <td class="fw-bold">WhatsApp Phone:</td>
                        <td>{{ $post->wphone }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Date Admission:</td>
                        <td>{{ $post->date_admission }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Date of Birth:</td>
                        <td>{{ $post->student_dob }}</td>
                    </tr>
                </table>

                <h2 style="color: #333;">Branch Information</h2>
                <table>
                    <tr>
                        <td class="fw-bold">Branch Name:</td>
                        <td>{{ $branch->name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Branch Code:</td>
                        <td>{{ $branch->code }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Branch Head:</td>
                        <td>{{ $branch->head }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Branch Email:</td>
                        <td>{{ $branch->email }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Branch Address:</td>
                        <td>{{ $branch->address }},<br> {{ $cities->name }}</td>
                    </tr>
                </table>
            </div>
    </div>
</body>

</html>
