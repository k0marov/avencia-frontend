import 'package:helpers/logic/entity/network_use_case_factory.dart';

import 'money.dart';

class MoneyMapper implements OutMapper<Money> {
  const MoneyMapper();
  @override
  Money fromJson(Map<String, dynamic> json) => Money(
        json["currency"],
        json["amount"].toDouble(),
      );
}
