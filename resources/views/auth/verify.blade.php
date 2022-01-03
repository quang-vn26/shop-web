@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Địa chỉ Email đã được xác thực') }}</div>

                <div class="card-body">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('Một đường link xác thực đã được gửi tới email của bạn') }}
                        </div>
                    @endif

                    {{ __('Hãy kiểm tra email để xác thực') }}
                    {{ __('Không nhận được email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('nhấn vào đây để gửi email mới') }}</button>.
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
