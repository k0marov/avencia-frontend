import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/core/network_usecase.dart';

class MoneyMapper implements OutMapper<Money> {
  @override
  Money fromJson(Map<String, dynamic> json) => Money(
    json["currency"], 
    json["amount"].toDouble(), 
  );
}
