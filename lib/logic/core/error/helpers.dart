import 'package:dartz/dartz.dart';

import 'failures.dart';

Failure throwableToFailure(dynamic e) => e is Failure ? e : UnknownFailure(e);

Future<Either<Failure, T>> failureSafeCall<T>(Future<T> Function() call) async {
  try {
    return Right(await call());
  } catch (e) {
    return Left(throwableToFailure(e));
  }
}
