@extends('backend.admin.layouts.app')
@section('title', 'Login - Admin')
@section('nav', 'index')


@section('main')
    {{ Auth::user() }}
    {{ Auth::id() }}
@endsection
