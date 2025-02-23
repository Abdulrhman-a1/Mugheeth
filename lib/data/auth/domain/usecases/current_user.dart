import 'package:fpdart/src/either.dart';
import 'package:graduation/common/helper/error/failures.dart';
import 'package:graduation/data/auth/domain/entities/user.dart';
import 'package:graduation/data/auth/domain/usecases/usercases.dart';

import '../repo/auth_repo.dart';

class CurrentUser implements Usercases<User, NoParams> {
  final AuthRepo authRepo;
  const CurrentUser(this.authRepo);
  @override
  Future<Either<Failures, User>> call(NoParams params) async {
    return await authRepo.getCurrentUserData();
  }
}
