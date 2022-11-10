import 'package:avencia/logic/core/money.dart';
import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String id;
  final Currency currency;
  final Money money;
  @override
  List get props => [id, currency, money];
  const Wallet({
    required this.id,
    required this.currency,
    required this.money,
  });
}

class WalletCreationVal extends Equatable {
  final Currency currency;
  @override
  List get props => [currency];
  const WalletCreationVal({required this.currency});
}
