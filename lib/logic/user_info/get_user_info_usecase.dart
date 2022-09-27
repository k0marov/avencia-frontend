import 'package:avencia/logic/core/entity/network_use_case_factory.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';
import 'internal/entities.dart';

typedef GetUserInfoUseCase = Future<Either<Exception, UserInfo>> Function(void);

GetUserInfoUseCase newGetUserInfoUseCase(
  NetworkUseCaseFactory nuc,
  UserInfoMapper mapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (_, host) => Uri.https(host, getUserInfoEndpoint, {}),
      method: "GET",
      outMapper: mapper,
    );
