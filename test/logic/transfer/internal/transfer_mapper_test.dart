import 'dart:convert';

import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test("should convert transfer data to valid json", () async {
    // arrange
    final tTransfer = TransferData("sam@skomarov.com", Money("USD", 420.42));
    // act
    final result = TransferMapper().toJson(tTransfer);
    // assert
    final wantJson = json.decode(fixture("transfer.json"));
    expect(result, wantJson);
  });
}
