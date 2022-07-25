import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:dartz/dartz.dart';

typedef TransferUseCase = Future<Either<Exception, void>> Function(TransferData);

TransferUseCase NewTransferUseCase(AuthHTTPClient httpClient, TransferMapper mapper) =>
    (t) => withExceptionHandling(() async {
          final reqBody = json.encode(mapper.toJson(t));
          httpClient.post(Uri.https(apiHost, transferEndpoint), body: reqBody);
        });
