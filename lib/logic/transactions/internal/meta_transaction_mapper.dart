import 'package:avencia/logic/transactions/internal/values.dart';

import '../../core/entity/network_use_case_factory.dart';

// TODO: test
class MetaTransactionMapper implements InpMapper<MetaTransaction> {
  @override
  Map<String, dynamic> toJson(MetaTransaction inp) => {
        "type": transactionTypeValue(inp.type),
      };
}
