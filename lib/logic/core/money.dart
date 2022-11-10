import 'package:equatable/equatable.dart';

typedef Currency = String;
typedef MoneyAmount = double;

MoneyAmount parseMoneyAmount(String s) => num.parse(s).toDouble();

class Money extends Equatable {
  final Currency currency;
  final MoneyAmount amount;
  @override
  List get props => [currency, amount];

  const Money(this.currency, this.amount);
}
