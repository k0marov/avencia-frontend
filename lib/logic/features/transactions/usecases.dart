import 'package:avencia/config/const.dart';
import 'package:dartz/dartz.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http.dart';

import 'internal/meta_transaction_mapper.dart';
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
      method: HTTPMethods.post,
      outMapper: codeMapper,
    );
