import 'package:equatable/equatable.dart';

typedef Currency = String;
typedef MoneyAmount = String;

class Money extends Equatable {
  final Currency currency;
  final MoneyAmount amount;
  @override
  List get props => [currency, amount];

  const Money(this.currency, this.amount);
}
