import '../../core/entity/network_use_case_factory.dart';
import 'values.dart';

class TransactionCodeMapper implements OutMapper<TransactionCode> {
  @override
  TransactionCode fromJson(Map<String, dynamic> json) => TransactionCode(
        json['transaction_code'],
        DateTime.fromMillisecondsSinceEpoch(json['expires_at'] * 1000),
      );
}
