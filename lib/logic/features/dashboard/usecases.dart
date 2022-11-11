import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/dashboard/internal/user_info_mapper.dart';
import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

typedef GetFullUserInfoUseCase = Future<UseCaseRes<FullUserInfo>> Function();

GetFullUserInfoUseCase newGetUserInfoUseCase(
  NetworkUseCaseFactory nuc,
  FullUserInfoMapper mapper,
) =>
    () => nuc.newBaseNetworkUseCase(
          inpMapper: NoInpMapper(),
          getUri: (_, host) => Uri.https(host, getUserInfoEndpoint),
          method: HTTPMethods.get,
          outMapper: mapper,
        )(null);
