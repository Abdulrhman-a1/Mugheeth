import "package:fpdart/fpdart.dart";
import "package:graduation/common/helper/error/failures.dart";

abstract interface class AuthRepo {
  Future<Either<Failures, String>> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failures, String>> loginwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
