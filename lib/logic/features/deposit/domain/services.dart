import 'package:avencia/logic/core/error/helpers.dart';
import 'package:avencia/logic/features/deposit/domain/contracts.dart';
import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

typedef DepositCodeGetter = Future<Either<Failure, TransactionCode>> Function();

DepositCodeGetter newDepositCodeGetter(DepositCodeRequester request) => () => failureSafeCall(request);
