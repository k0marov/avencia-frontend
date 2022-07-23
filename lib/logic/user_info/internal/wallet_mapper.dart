import 'entities.dart';

class WalletMapper {
  Wallet fromJson(Map<String, dynamic> json) {
    final jsonWallet = json["wallet"] as Map<String, dynamic>;
    return jsonWallet.map(
      (curr, bal) => MapEntry(curr, bal.toDouble()),
    );
  }
}
