import 'package:avencia/logic/core/error/failures.dart';
import 'package:avencia/logic/features/deposit/domain/entities.dart';

class TransactionCodeMapper {
  TransactionCode fromJson(Map<String, dynamic> json) {
    try {
      return TransactionCode(
        json['transaction_code'],
        DateTime.fromMillisecondsSinceEpoch(json['expires_at'] * 1000),
      );
    } catch (e) {
      throw MappingFailure();
    }
  }
}
