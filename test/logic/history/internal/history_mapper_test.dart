import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/core/money_mapper.dart';
import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/history_mapper.dart';
import 'package:avencia/logic/history/internal/transaction_source_mapper.dart';
import 'package:avencia/logic/history/internal/values.dart';

import '../../../shared/base_mapper.dart';

void main() {
  const mapper = HistoryMapper(TransactionSourceMapper(), MoneyMapper());
  final entity = History([
    HistoryEntry(
      DateTime.utc(2022, 8, 3, 8, 9, 14),
      const TransactionSource(TransactionSourceType.creditCard, "42"),
      const Money("USD", 420.42),
    ),
    HistoryEntry(
      DateTime.utc(1999, 3, 24, 4, 0, 0),
      const TransactionSource(TransactionSourceType.cash, "some-detail"),
      const Money("RUB", 1000),
    ),
  ]);

  baseOutMapperTest(
    entity: entity,
    mapper: mapper,
    fixtureName: "history.json",
  );
}
