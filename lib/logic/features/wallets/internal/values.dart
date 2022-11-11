import 'package:avencia/logic/core/money.dart';
import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String id;
  final Money money;
  @override
  List get props => [id, money];
  const Wallet({
    required this.id,
    required this.money,
  });
}

class WalletCreationVal extends Equatable {
  final Currency currency;
  @override
  List get props => [currency];
  const WalletCreationVal({required this.currency});
}

class Wallets extends Equatable {
  final List<Wallet> wallets;
  final MoneyAmount totalUSD;
  @override
  List get props => [wallets];
  const Wallets({required this.wallets})
      : totalUSD = 0; // TODO: implement the algorithm for getting the totalUSD value
}
