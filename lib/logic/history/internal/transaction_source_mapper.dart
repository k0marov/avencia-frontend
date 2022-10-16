import 'package:avencia/logic/history/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class UnknownTransactionTypeException implements Exception {}

class TransactionSourceMapper implements OutMapper<TransactionSource> {
  const TransactionSourceMapper();

  TransactionSourceType _decodeType(String type) {
    switch (type) {
      case "credit-card":
        return TransactionSourceType.creditCard;
      case "cash":
        return TransactionSourceType.cash;
      case "crypto":
        return TransactionSourceType.crypto;
      case "transfer":
        return TransactionSourceType.transfer;
      default:
        throw UnknownTransactionTypeException();
    }
  }

  /// Throws UnknownTransactionTypeException
  @override
  TransactionSource fromJson(Map<String, dynamic> json) => TransactionSource(
        _decodeType(json["type"]),
        json["detail"],
      );
}
