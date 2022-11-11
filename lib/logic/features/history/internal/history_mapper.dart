import 'package:avencia/logic/features/history/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/general.dart';

import '../../../core/money.dart';
import 'entities.dart';

class HistoryMapper implements OutMapper<History> {
  final OutMapper<TransactionSource> sourceMapper;
  final OutMapper<Money> moneyMapper;
  const HistoryMapper(this.sourceMapper, this.moneyMapper);

  @override
  History fromJson(Map<String, dynamic> json) {
    final entriesJson = json["entries"] as List;
    final entries = entriesJson
        .map((entry) => HistoryEntry(
              fromUnixSec(entry["time"]),
              sourceMapper.fromJson(entry["source"]),
              moneyMapper.fromJson(entry["money"]),
            ))
        .toList();
    return History(entries);
  }
}
