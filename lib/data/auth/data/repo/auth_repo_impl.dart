import 'package:fpdart/src/either.dart';
import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/entities/user.dart';
import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:graduation/data/auth/data/datasources/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource remoteDataSource;
  const AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, User>> loginwithEmailAndPassword({
    required Pattern email,
    required String password,
    required String name,
  }) {
    // TODO: implement loginwithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, User>> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String Bdata,
    required String gender,
  }) async {
    try {
      final user = await remoteDataSource.signUpwithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        Bdata: Bdata,
        gender: gender,
      );
      return Right(user);
    } on ServerException catch (e) {
      print(e.message);
      return Left(Failures(e.toString()));
    }
  }
}
