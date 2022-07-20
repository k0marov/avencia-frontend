import 'dart:convert';

import 'package:avencia/logic/transactions/transaction_code.dart';
import 'package:avencia/logic/transactions/transaction_code_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test("should convert a valid fixture to a string code", () async {
    // arrange
    final tJson = json.decode(fixture("code.json"));
    // act
    final result = TransactionCodeMapper().fromJson(tJson);
    // assert
    expect(
        result,
        TransactionCode(
          "4242",
          DateTime(2022, 7, 19, 4, 49, 25),
        ));
  });
}
