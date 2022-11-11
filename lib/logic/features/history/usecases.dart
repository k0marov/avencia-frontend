import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/history/internal/history_mapper.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

import 'internal/entities.dart';

typedef GetHistoryUseCase = Future<UseCaseRes<History>> Function();

GetHistoryUseCase newGetHistoryUseCase(
  NetworkUseCaseFactory nuc,
  HistoryMapper mapper,
) =>
    () => nuc.newBaseNetworkUseCase(
          inpMapper: NoInpMapper(),
          getUri: (_, host) => Uri.https(host, historyEndpoint),
          method: HTTPMethods.get,
          outMapper: mapper,
        )(null);
