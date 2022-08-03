import '../../core/network_usecase.dart';
import 'transaction_code.dart';

class TransactionCodeMapper implements OutMapper<TransactionCode> {
  TransactionCode fromJson(Map<String, dynamic> json) => TransactionCode(
        json['transaction_code'],
        DateTime.fromMillisecondsSinceEpoch(json['expires_at'] * 1000),
      );
}
