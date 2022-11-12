import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

class ExchangeRatesMapper implements OutMapper<ExchangeRates> {
  @override
  ExchangeRates fromJson(Map<String, dynamic> json) => json.cast<String, double>();
}
