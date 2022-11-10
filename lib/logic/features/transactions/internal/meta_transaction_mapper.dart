import 'package:avencia/logic/features/transactions/internal/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class MetaTransactionMapper implements InpMapper<MetaTransaction> {
  @override
  Map<String, dynamic> toJson(MetaTransaction inp) => {
        "type": transactionTypeValue(inp.type),
        "id": inp.walletId,
      };
}
