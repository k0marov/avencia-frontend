import 'package:avencia/logic/core/network_usecase.dart';

import 'entities.dart';

class LimitsMapper implements Mapper<Limits> {
  @override 
  Limits fromJson(Map<String, dynamic> json) {
    final Limits result = {};
    for (final entry in json.entries) {
      result[entry.key] = Limit(
          entry.value["withdrawn"].toDouble(), entry.value["max"].toDouble());
    }
    return result;
  }
}
