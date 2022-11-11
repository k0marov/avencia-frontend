import 'package:avencia/logic/core/money_mapper.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class WalletMapper implements OutMapper<Wallet> {
  final MoneyMapper _money;
  const WalletMapper(this._money);
  @override
  Wallet fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        money: _money.fromJson(json),
      );
}

class WalletsMapper implements OutMapper<Wallets> {
  final WalletMapper _wallet;
  const WalletsMapper(this._wallet);
  @override
  Wallets fromJson(Map<String, dynamic> json) => Wallets(
        wallets: (json["wallets"] as List)
            .map(
              (w) => _wallet.fromJson(w),
            )
            .toList(),
      );
}
