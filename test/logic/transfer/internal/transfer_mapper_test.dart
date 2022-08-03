
import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';

import '../../../shared/base_inp_mapper.dart';

void main() {
  baseInpMapperTest(
    entity: const TransferData("sam@skomarov.com", Money("USD", 420.42)),
    mapper: TransferMapper(),
    fixtureName: "transfer.json",
  );
}
