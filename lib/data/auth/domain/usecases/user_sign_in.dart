import 'package:fpdart/fpdart.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:graduation/data/auth/domain/usecases/usercases.dart';
import '../entities/user.dart';

class UserSignIn implements Usercases<User, UserSignInParams> {
  final AuthRepo authRepo;
  const UserSignIn(this.authRepo);
  @override
  Future<Either<Failures, User>> call(UserSignInParams params) async {
    return await authRepo.loginwithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
