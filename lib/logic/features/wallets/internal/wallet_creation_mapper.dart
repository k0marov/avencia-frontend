import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class WalletCreationMapper extends InpMapper<WalletCreationVal> {
  @override
  Map<String, dynamic> toJson(WalletCreationVal v) => {
        "currency": v.currency,
      };
}
