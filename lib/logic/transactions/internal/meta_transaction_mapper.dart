import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/transactions/internal/values.dart';

// TODO: test
class MetaTransactionMapper implements InpMapper<MetaTransaction> {
  @override
  Map<String, dynamic> toJson(MetaTransaction inp) => {
        "type": transactionTypeValue(inp.type),
      };
}
