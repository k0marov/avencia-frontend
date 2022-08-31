import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/history_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../config/const.dart';

typedef GetHistoryUseCase = Future<Either<Exception, History>> Function(void);

GetHistoryUseCase newGetHistoryUseCase(
  AuthHTTPClient client,
  HistoryMapper mapper,
) =>
    newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (_) => Uri.https(apiHost, "", {}),
      method: "GET",
      client: client,
      outMapper: mapper,
    );
