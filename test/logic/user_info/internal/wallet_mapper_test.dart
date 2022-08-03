
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';

import '../../../shared/base_out_mapper.dart';

void main() {
  baseOutMapperTest(
    entity: {
      "USD": 1200.5,
      "RUB": 30000,
      "BTC": 0.001,
    },
    mapper: WalletMapper(),
    fixtureName: "wallet.json",
  );
}
