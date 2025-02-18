part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String Bdata;
  final String gender;

  AuthSignUp({
    required this.Bdata,
    required this.gender,
    required this.email,
    required this.password,
    required this.name,
  });

}

final class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthSignIn({
    required this.email,
    required this.password,
  });

}
