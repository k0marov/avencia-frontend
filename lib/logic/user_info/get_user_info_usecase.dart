import 'dart:convert';

import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';
import 'internal/entities.dart';

// TODO: generalize this kind of usecase, that just calls and endpoint and maps its response to an entity

typedef GetUserInfoUseCase = Future<Either<Exception, UserInfo>> Function();

GetUserInfoUseCase newGetUserInfoUseCase(AuthHTTPClient httpClient, UserInfoMapper mapper) => () {
      return withExceptionHandling(() async {
        final uri = Uri.https(apiHost, getUserInfoEndpoint, {});
        final response = await httpClient.get(uri);
        return mapper.fromJson(json.decode(response.body));
      });
    };
