import 'package:fpdart/fpdart.dart';
import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/entities/user.dart';
import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:graduation/data/auth/data/datasources/auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource remoteDataSource;
  const AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, User>> loginwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginwithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failures, User>> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String Bdata,
    required String gender,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpwithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        gender: gender,
        Bdata: Bdata,
      ),
    );
  }

  Future<Either<Failures, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      final user = await fn();
      return Right(user);
    } on ServerException catch (e) {
      print(e.message);
      return Left(Failures(e.message));
    } on sb.AuthException catch (e) {
      print(e.message);
      return Left(Failures(e.message));
    }
  }
}
