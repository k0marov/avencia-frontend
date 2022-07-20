import 'transaction_code.dart';

class TransactionCodeMapper {
  TransactionCode fromJson(Map<String, dynamic> json) => TransactionCode(
        json['transaction_code'],
        DateTime.fromMillisecondsSinceEpoch(json['expires_at'] * 1000),
      );
}
