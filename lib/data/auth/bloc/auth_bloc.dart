import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_event.dart';
import 'package:graduation/data/auth/bloc/auth_state.dart';
import 'package:graduation/data/auth/service/auth_service.dart'
    show AuthService;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    // Handling sign-in event
    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await authService.signInWithEmailPassword(
          event.email,
          event.password,
        );
        if (response?.session != null) {
          print('Sign-in successful for user: ${response?.user?.email}');
          emit(AuthSuccess());
        } else {
          print('Sign-in failed: No session returned.');
          emit(AuthFailure(message: 'Failed to sign in. Please try again.'));
        }
      } catch (e, stackTrace) {
        print('Sign-in error: $e\n$stackTrace');
        emit(AuthFailure(message: 'An error occurred during sign-in.'));
      }
    });

    // Handling sign-up event
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await authService.signUpWithEmailPassword(
          event.email,
          event.password,
          event.gender,
          event.Bdata,
          event.name,
        );
        if (response?.user != null) {
          print('Sign-up successful for user: ${response?.user?.email}');
          authService.getCurrentUserEmail(); // Just for logging purposes
          emit(AuthSuccess());
        } else {
          print('Sign-up failed: No user created.');
          emit(AuthFailure(message: 'Failed to sign up. Please try again.'));
        }
      } catch (e, stackTrace) {
        print('Sign-up error: $e\n$stackTrace');
        emit(AuthFailure(message: 'An error occurred during sign-up.'));
      }
    });

    // Handling sign-out event
    on<AuthSignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await authService.signOut();
        print('User signed out successfully.');
        emit(AuthInitial());
      } catch (e, stackTrace) {
        print('Sign-out error: $e\n$stackTrace');
        emit(AuthFailure(message: 'An error occurred during sign-out.'));
      }
    });

    // Handling reset password event
    on<AuthConfirmResetPassword>((event, emit) async {
  emit(AuthLoading());
  try {
    await authService.updateUserPassword(event.oobCode, event.newPassword);
    emit(AuthSuccess());
  } catch (e) {
    emit(AuthFailure(message: "فشل في إعادة تعيين كلمة المرور"));
  }
});

    // Handling reset password event
    on<AuthResetPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await authService.resetPassword(event.email);
        emit(AuthResendSuccess());
      } catch (e) {
        emit(AuthFailure(message: "Failed to send reset email."));
      }
    });

    // Handling get current user event
    on<GetCurrentUser>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = authService.getCurrentUserEmail();
        print('Current user: $user');
        emit(AuthSuccess());
      } catch (e, stackTrace) {
        print('Get current user error: $e\n$stackTrace');
      }
    });
  }
}
