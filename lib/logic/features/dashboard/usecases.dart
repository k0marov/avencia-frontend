import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/dashboard/internal/user_info_mapper.dart';
import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

typedef GetUserInfoUseCase = Future<UseCaseRes<UserInfo>> Function();

GetUserInfoUseCase newGetUserInfoUseCase(
  NetworkUseCaseFactory nuc,
  UserInfoMapper mapper,
) =>
    () => nuc.newBaseNetworkUseCase(
          inpMapper: NoInpMapper(),
          getUri: (_, host) => Uri.http(host, getUserInfoEndpoint),
          method: HTTPMethods.get,
          outMapper: mapper,
        )(null);
