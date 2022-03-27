part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class ErrorOccured extends AuthState {
  final String error;
  ErrorOccured({required this.error});
}

class PhoneNumberSubmitted extends AuthState {}

class PhoneOTPVerified extends AuthState {}
