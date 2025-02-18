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
      debugPrint("AuthSignUp event triggered");

      emit(AuthLoading());

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
        (failure) {
          debugPrint("Auth Failure: ${failure.message}");
          emit(AuthFailure(failure.message));
        },
        (user) {
          debugPrint("Auth Success: User signed up!");
          emit(AuthSuccess(user));
        },
      );
    });
  }
}
