import 'package:avencia/logic/core/money.dart';
import 'package:equatable/equatable.dart';

class Limit extends Equatable {
  final MoneyAmount withdrawn;
  final MoneyAmount max;

  @override
  List get props => [withdrawn, max];

  const Limit(this.withdrawn, this.max);
}

typedef Limits = Map<Currency, Limit>;
typedef Wallet = Map<Currency, MoneyAmount>;
