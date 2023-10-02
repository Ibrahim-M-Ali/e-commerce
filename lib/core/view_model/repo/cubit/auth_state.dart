part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  // final User user;
  AuthAuthenticated();
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
