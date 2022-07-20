import 'dart:convert';

import 'package:avencia/logic/core/error/failures.dart';
import 'package:avencia/logic/features/deposit/data/mappers.dart';
import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

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
  test("should throw MappingFailure if json is invalid", () async {
    // assert
    expect(() => TransactionCodeMapper().fromJson({"x": "y"}), throwsA(MappingFailure()));
  });
}
