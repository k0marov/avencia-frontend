import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';

class TransferMapper {
  Map<String, dynamic> toJson(TransferData t) => {
        "recipient_identifier": t.recipientEmail,
        "currency": t.money.currency,
        "amount": t.money.amount,
      };
}
