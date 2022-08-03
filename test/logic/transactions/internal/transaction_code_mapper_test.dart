
import 'package:avencia/logic/transactions/internal/transaction_code.dart';
import 'package:avencia/logic/transactions/internal/transaction_code_mapper.dart';

import '../../../shared/base_mapper.dart';


void main() {
  baseOutMapperTest(
    entity: TransactionCode(
          "4242",
          DateTime(2022, 7, 19, 4, 49, 25),
        ),
    mapper: TransactionCodeMapper(),
    fixtureName: "code.json",
  );
}
