part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class ErrorOccured extends AuthState {
  final String error;
  ErrorOccured({required this.error});
}

class PhoneNumberSubmitted extends AuthState {}

class PhoneOTPVerified extends AuthState {}

class UploadedOnFireStoreSucess extends AuthState {}

class UploadedOnFireStoreFailed extends AuthState {
  final String error;
  UploadedOnFireStoreFailed({required this.error});
}
