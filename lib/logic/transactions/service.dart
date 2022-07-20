import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/transactions/transaction_code.dart';
import 'package:dartz/dartz.dart';

import 'transaction_code_mapper.dart';

typedef TransactionCodeGetter = Future<Either<Exception, TransactionCode>> Function();

TransactionCodeGetter newTransactionCodeGetter(AuthHTTPClient httpClient, TransactionCodeMapper codeMapper) =>
    () async {
      return withExceptionHandling(() async {
        final response = await httpClient.get(Uri.https(apiHost, genTransactionCodeEndpoint, {}));
        return codeMapper.fromJson(json.decode(response.body));
      });
    };
