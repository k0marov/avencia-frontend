import 'package:avencia/logic/core/entity/network_use_case_factory.dart';
import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/history_mapper.dart';
import 'package:dartz/dartz.dart';

typedef GetHistoryUseCase = Future<Either<Exception, History>> Function(void);

GetHistoryUseCase newGetHistoryUseCase(
  NetworkUseCaseFactory nuc,
  HistoryMapper mapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (_, host) => Uri.https(host, "", {}),
      method: "GET",
      outMapper: mapper,
    );
