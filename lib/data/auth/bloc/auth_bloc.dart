import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/auth/domain/usecases/user_sign_up.dart';
import '../domain/entities/user.dart';
import '../domain/usecases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
  }
  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
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
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    debugPrint("AuthSignIn event triggered");

    emit(AuthLoading());

    final res = await _userSignIn(
      UserSignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) {
        debugPrint("Auth Failure: ${failure.message}");
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint("Auth Success: User signed in!");
        emit(AuthSuccess(user));
      },
    );
  }
}
