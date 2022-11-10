import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class WalletMapper extends OutMapper<Wallet> {
  @override
  Wallet fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        currency: json["currency"],
        money: parseMoneyAmount(json["amount"].toString()),
      );
}

class WalletsMapper extends OutMapper<Wallets> {
  final WalletMapper _wMapper = WalletMapper();
  @override
  Wallets fromJson(Map<String, dynamic> json) {
    print(json);
    return Wallets(
      wallets: (json["wallets"] as List)
          .map(
            (w) => _wMapper.fromJson(w),
          )
          .toList(),
    );
  }
}
