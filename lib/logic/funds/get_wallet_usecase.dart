import 'dart:convert';

import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/funds/internal/wallet_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';
import 'internal/entities.dart';

typedef GetWalletUseCase = Future<Either<Exception, Wallet>> Function();

GetWalletUseCase newGetWalletUseCase(AuthHTTPClient httpClient, WalletMapper mapper) => () {
      return withExceptionHandling(() async {
        final uri = Uri.https(apiHost, getWalletEndpoint, {});
        final response = await httpClient.get(uri);
        return mapper.fromJson(json.decode(response.body));
      });
    };
