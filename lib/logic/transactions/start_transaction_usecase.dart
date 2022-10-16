import 'package:avencia/config/const.dart';
import 'package:avencia/logic/transactions/internal/meta_transaction_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

import 'internal/transaction_code_mapper.dart';
import 'internal/values.dart';

typedef StartTransactionUseCase = Future<Either<Exception, TransactionCode>> Function(
    MetaTransaction);

StartTransactionUseCase newStartTransactionUseCase(
  NetworkUseCaseFactory nuc,
  MetaTransactionMapper metaTransMapper,
  TransactionCodeMapper codeMapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: metaTransMapper,
      getUri: (type, host) => Uri.https(
        host,
        genTransactionCodeEndpoint,
      ),
      method: "POST",
      outMapper: codeMapper,
    );
