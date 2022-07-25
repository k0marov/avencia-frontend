import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/core/money.dart';
import 'package:dartz/dartz.dart';

typedef TransferUseCase = Future<Either<Exception, void>> Function(
    String recipientEmail, Currency curr, MoneyAmount amount);

TransferUseCase NewTransferUseCase() => (email, curr, amount) => withExceptionHandling(() async {
      throw UnimplementedError();
    });
