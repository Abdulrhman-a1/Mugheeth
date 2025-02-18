import "package:fpdart/fpdart.dart";
import "package:graduation/common/helper/error/failures.dart";

import "../entities/user.dart";

abstract interface class AuthRepo {
  Future<Either<Failures, User>> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String Bdata,
    required String gender,
  });
  Future<Either<Failures, User>> loginwithEmailAndPassword({
    required String email,
    required String password,
  });
}
