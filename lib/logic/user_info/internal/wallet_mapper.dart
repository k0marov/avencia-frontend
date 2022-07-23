import 'entities.dart';

class WalletMapper {
  Wallet fromJson(Map<String, dynamic> json) {
    return json.map(
      (curr, bal) => MapEntry(curr, bal.toDouble()),
    );
  }
}
