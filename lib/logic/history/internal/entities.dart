import 'package:equatable/equatable.dart';

import '../../core/money.dart';
import 'values.dart';

class HistoryEntry extends Equatable {
  final DateTime transactedAt;
  final TransactionSource source;
  final Money money;
  @override
  List get props => [transactedAt, source, money];

  const HistoryEntry(this.transactedAt, this.source, this.money);
}

class History extends Equatable {
  final List<HistoryEntry> entries;
  @override
  List get props => [entries];

  const History(this.entries);
}
