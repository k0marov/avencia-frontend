import 'package:avencia/logic/core/general.dart';
import 'package:avencia/logic/core/money/money.dart';
import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/values.dart';

import '../../core/entity/network_use_case_factory.dart';

class HistoryMapper implements OutMapper<History> {
  final OutMapper<TransactionSource> sourceMapper;
  final OutMapper<Money> moneyMapper;
  const HistoryMapper(this.sourceMapper, this.moneyMapper);

  @override
  History fromJson(Map<String, dynamic> json) {
    final entriesJson = json["entries"] as List;
    final entries = entriesJson
        .map((entry) => HistoryEntry(
              fromUnixSec(entry["transacted_at"]),
              sourceMapper.fromJson(entry["source"]),
              moneyMapper.fromJson(entry["money"]),
            ))
        .toList();
    return History(entries);
  }
}
