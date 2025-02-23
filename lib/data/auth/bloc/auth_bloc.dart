import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/auth/domain/usecases/current_user.dart';
import 'package:graduation/data/auth/domain/usecases/user_sign_up.dart';
import 'package:graduation/data/auth/domain/usecases/usercases.dart';
import '../domain/entities/user.dart';
import '../domain/usecases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());
    res.fold(
      (failure) {
        debugPrint("Auth Failure: ${failure.message}");
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint("Auth Success: User is logged in!");
        print(user.email);
        emit(AuthSuccess(user));
      },
    );
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
