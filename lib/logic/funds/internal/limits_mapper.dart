import 'package:avencia/logic/funds/internal/entities.dart';

class LimitsMapper {
  Limits fromJson(Map<String, dynamic> json) {
    final limitsJson = json["limits"] as Map<String, dynamic>;
    final Limits result = {};
    for (final entry in limitsJson.entries) {
      result[entry.key] = Limit(entry.value["withdrawn"].toDouble(), entry.value["max"].toDouble());
    }
    return result;
  }
}
