import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/history/internal/history_mapper.dart';
import 'package:equatable/equatable.dart';
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

List<DayHistory> splitHistoryByDay(History h) {
  final res = <DayHistory>[];
  for (final e in h.entries) {
    final current = res.isNotEmpty ? res.last.day : null;
    final diff = current?.difference(e.transactedAt);
    if (diff != null ? diff.inDays > 0 : true) {
      res.add(DayHistory(e.transactedAt, [e]));
    } else {
      res.first.operations.add(e);
    }
  }
  return res;
}

class DayHistory extends Equatable {
  final DateTime day;
  final List<HistoryEntry> operations;
  @override
  List get props => [day, operations];
  const DayHistory(this.day, this.operations);
}
