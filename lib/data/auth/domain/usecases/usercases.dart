import 'package:fpdart/fpdart.dart';
import 'package:graduation/common/helper/error/failures.dart';

abstract interface class Usercases<SuccessType, Params> {
  Future<Either<Failures, SuccessType>> call(Params params);
}

 