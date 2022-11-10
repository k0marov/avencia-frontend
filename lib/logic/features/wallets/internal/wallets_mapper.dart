import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class WalletMapper extends OutMapper<Wallet> {
  @override
  Wallet fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        currency: json["currency"],
        money: json["money"],
      );
}

class WalletsMapper extends OutMapper<List<Wallet>> {
  final WalletMapper _wMapper = WalletMapper();
  @override
  List<Wallet> fromJson(Map<String, dynamic> json) =>
      (json["wallets"] as List<Map<String, dynamic>>)
          .map(
            (w) => _wMapper.fromJson(w),
          )
          .toList();
}
