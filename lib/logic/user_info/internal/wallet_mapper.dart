import '../../core/entity/network_use_case_factory.dart';
import 'entities.dart';

class WalletMapper implements OutMapper<Wallet> {
  @override
  Wallet fromJson(Map<String, dynamic> json) {
    return json.map(
      (curr, bal) => MapEntry(curr, bal.toDouble()),
    );
  }
}
