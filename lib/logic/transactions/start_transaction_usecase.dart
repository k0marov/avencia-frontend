import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/transactions/internal/meta_transaction_mapper.dart';
import 'package:dartz/dartz.dart';

import 'internal/transaction_code_mapper.dart';
import 'internal/values.dart';

typedef StartTransactionUseCase = Future<Either<Exception, TransactionCode>>
    Function(MetaTransaction);

StartTransactionUseCase newStartTransactionUseCase(
  AuthHTTPClient httpClient,
  MetaTransactionMapper metaTransMapper,
  TransactionCodeMapper codeMapper,
) =>
    newBaseNetworkUseCase(
      inpMapper: metaTransMapper,
      getUri: (type) => Uri.https(
        apiHost,
        genTransactionCodeEndpoint,
      ),
      method: "POST",
      client: httpClient,
      outMapper: codeMapper,
    );

