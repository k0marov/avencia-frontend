import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';

class TransferMapper implements InpMapper<TransferData> {

  @override
  Map<String, dynamic> toJson(TransferData t) => {
        "recipient_identifier": t.recipientEmail,
        "money": {
          "currency": t.money.currency,
          "amount": t.money.amount,
        },
      };
}
