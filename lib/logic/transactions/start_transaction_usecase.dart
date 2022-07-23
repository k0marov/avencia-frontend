import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/transactions/internal/transaction_code.dart';
import 'package:dartz/dartz.dart';

import 'internal/transaction_code_mapper.dart';

typedef StartTransactionUseCase = Future<Either<Exception, TransactionCode>> Function(TransactionType);

StartTransactionUseCase newStartTransactionUseCase(AuthHTTPClient httpClient, TransactionCodeMapper codeMapper) =>
    (TransactionType type) async {
      return withExceptionHandling(() async {
        final uri = Uri.https(apiHost, genTransactionCodeEndpoint, {transactionTypeKey: transactionTypeValue(type)});
        final response = await httpClient.get(uri);
        print(response.body);
        return codeMapper.fromJson(json.decode(response.body));
      });
    };
