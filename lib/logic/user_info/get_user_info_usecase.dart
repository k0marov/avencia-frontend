
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';
import 'internal/entities.dart';


typedef GetUserInfoUseCase = Future<Either<Exception, UserInfo>> Function(void);

GetUserInfoUseCase newGetUserInfoUseCase(
  AuthHTTPClient httpClient,
  UserInfoMapper mapper,
) =>
    newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (_) => Uri.https(apiHost, getUserInfoEndpoint, {}),
      method: "GET",
      client: httpClient,
      outMapper: mapper,
    );
