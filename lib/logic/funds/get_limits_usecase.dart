import 'dart:convert';

import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/funds/internal/limits_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';
import 'internal/entities.dart';

typedef GetLimitsUseCase = Future<Either<Exception, Limits>> Function();

GetLimitsUseCase newGetLimitsUseCase(AuthHTTPClient httpClient, LimitsMapper mapper) => () {
      return withExceptionHandling(() async {
        final uri = Uri.https(apiHost, getLimitsEndpoint, {});
        final response = await httpClient.get(uri);
        return mapper.fromJson(json.decode(response.body));
      });
    };
