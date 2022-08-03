import 'package:avencia/logic/history/internal/entities.dart';
import 'package:avencia/logic/history/internal/history_mapper.dart';

import '../../../shared/base_out_mapper.dart';

void main() {
  baseOutMapperTest(
    entity: History(),
    mapper: HistoryMapper(),
    fixtureName: "history.json",
  );
}
