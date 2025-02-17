import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/auth/domain/usecases/user_sign_up.dart';

import '../domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      print("AuthSignUp event triggered"); // Debugging

      final res = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
          Bdata: event.Bdata,
          gender: event.gender,
        ),
      );

      res.fold(
        (l) {
          print("Auth Failure: ${l.message}"); // Debugging
          emit(AuthFailure(l.message));
        },
        (r) {
          print("Auth Success: User signed up!"); // Debugging
          emit(AuthSuccess(r));
        },
      );
    });
  }
}
