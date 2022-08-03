import 'package:avencia/logic/history/internal/transaction_source_mapper.dart';
import 'package:avencia/logic/history/internal/values.dart';

import '../../../shared/base_mapper.dart';

void main() {
  const mapper = TransactionSourceMapper();

  baseOutMapperTest(
    entity: const TransactionSource(
      TransactionSourceType.creditCard,
      "3333 4444 7777 8888",
    ),
    mapper: mapper,
    fixtureName: "transaction_source/credit_card.json",
  );
  baseOutMapperTest(
    entity: const TransactionSource(
      TransactionSourceType.cash,
      "some-detail, 4242",
    ),
    mapper: mapper,
    fixtureName: "transaction_source/cash.json",
  );
  baseOutMapperTest(
    entity: const TransactionSource(
      TransactionSourceType.crypto,
      "1234567890",
    ),
    mapper: mapper,
    fixtureName: "transaction_source/crypto.json",
  );
  baseOutMapperTest(
    entity: const TransactionSource(
      TransactionSourceType.transfer,
      "abcdefg",
    ),
    mapper: mapper,
    fixtureName: "transaction_source/transfer.json",
  );
}
