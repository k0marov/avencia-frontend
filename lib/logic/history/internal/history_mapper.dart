import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/values.dart';

import '../../core/network_usecase.dart';

class HistoryMapper implements OutMapper<History> {
  final OutMapper<TransactionSource> sourceMapper;
  final OutMapper<Money> moneyMapper;
  const HistoryMapper(this.sourceMapper, this.moneyMapper);

  @override
  History fromJson(Map<String, dynamic> json) {
    final entriesJson = json["entries"] as List;
    final entries = entriesJson
        .map((entry) => HistoryEntry(
              DateTime.fromMillisecondsSinceEpoch(entry["transacted_at"] * 1000).toUtc(),
              sourceMapper.fromJson(entry["source"]),
              moneyMapper.fromJson(entry["money"]),
            ))
        .toList();
    return History(entries);
  }
}
