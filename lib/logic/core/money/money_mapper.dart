import 'package:avencia/logic/core/money/money.dart';

import '../entity/network_use_case_factory.dart';

class MoneyMapper implements OutMapper<Money> {
  const MoneyMapper();
  @override
  Money fromJson(Map<String, dynamic> json) => Money(
        json["currency"],
        json["amount"].toDouble(),
      );
}
