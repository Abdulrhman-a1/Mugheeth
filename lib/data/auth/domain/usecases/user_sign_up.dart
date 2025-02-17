import 'package:fpdart/src/either.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/entities/user.dart';
import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:graduation/data/auth/domain/usecases/usercases.dart';

class UserSignUp implements Usercases<User, UserSignUpParams> {
  final AuthRepo authRepo;
  UserSignUp(this.authRepo);
  @override
  Future<Either<Failures, User>> call(UserSignUpParams params) async {
    return await authRepo.signUpwithEmailAndPassword(
        email: params.email,
        password: params.password,
        name: params.name,
        Bdata: params.Bdata,
        gender: params.gender);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  final String Bdata;
  final String gender;

  UserSignUpParams({
    required this.Bdata,
    required this.gender,
    required this.email,
    required this.password,
    required this.name,
  });
}
