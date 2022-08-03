
import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';

import '../../../shared/base_out_mapper.dart';

void main() {
  baseOutMapperTest(
    entity: {
      "USD": const Limit(420, 1000.5),
      "RUB": const Limit(2423.123, 30000.42),
    },
    mapper: LimitsMapper(),
    fixtureName: "limits.json",
  );
}
