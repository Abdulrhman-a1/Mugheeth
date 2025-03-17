import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// حدث تسجيل الدخول
class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthSignIn({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// حدث إنشاء حساب جديد
class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String gender;
  final String Bdata;
  final String name;

  AuthSignUp({
    required this.email,
    required this.password,
    required this.gender,
    required this.Bdata,
    required this.name,
  });

  @override
  List<Object?> get props => [email, password, gender, Bdata, name];
}

// حدث تسجيل الخروج
class AuthSignOut extends AuthEvent {}

class GetCurrentUser extends AuthEvent {}

class AuthResetPassword extends AuthEvent {
  final String email;

  AuthResetPassword({required this.email});

  @override
  List<Object?> get props => [email];
}

class AuthConfirmResetPassword extends AuthEvent {
  final String oobCode;
  final String newPassword;

  AuthConfirmResetPassword({required this.oobCode, required this.newPassword});
}