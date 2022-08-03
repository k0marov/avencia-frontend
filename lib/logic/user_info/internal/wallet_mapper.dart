import '../../core/network_usecase.dart';
import 'entities.dart';

class WalletMapper implements Mapper<Wallet> {

  @override
  Wallet fromJson(Map<String, dynamic> json) {
    return json.map(
      (curr, bal) => MapEntry(curr, bal.toDouble()),
    );
  }
}
