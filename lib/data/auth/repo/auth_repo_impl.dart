import 'package:fpdart/src/either.dart';
import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:graduation/data/datasources/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource remoteDataSource;
  const AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, String>> loginwithEmailAndPassword({
    required Pattern email,
    required String password,
    required String name,
  }) {
    // TODO: implement loginwithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userId = await remoteDataSource.signUpwithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(userId);
    } on ServerException catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
