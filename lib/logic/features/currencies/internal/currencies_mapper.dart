import 'package:helpers/logic/entity/network_use_case_factory.dart';

import '../values.dart';

class CurrenciesMapper implements InpMapper<List<CurrencyData>> {
  @override
  Map<String, dynamic> toJson(List<CurrencyData> v) => {
        "currencies": v.map((curr) => curr.code).toList(),
      };
}
