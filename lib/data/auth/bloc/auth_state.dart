import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// الحالة الافتراضية
class AuthInitial extends AuthState {}

// عند بدء العملية (Loading)
class AuthLoading extends AuthState {}

// عند نجاح العملية
class AuthSuccess extends AuthState {}

// عند فشل العملية مع رسالة الخطأ
class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
