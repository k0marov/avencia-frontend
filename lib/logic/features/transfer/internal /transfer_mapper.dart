import 'package:avencia/logic/features/transfer/internal%20/transfer_data.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class TransferMapper implements InpMapper<TransferData> {
  @override
  Map<String, dynamic> toJson(TransferData t) => {
        "recipient_identifier": t.recipientEmail,
        "source_wallet_id": t.myWallet.id,
        "money": t.money,
      };
}
