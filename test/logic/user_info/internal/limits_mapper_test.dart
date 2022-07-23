import 'dart:convert';

import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test("should convert a valid fixture to a limits entity", () async {
    // arrange
    final tJson = json.decode(fixture("limits.json"));
    const Limits wantLimits = {
      "USD": Limit(420, 1000.5),
      "RUB": Limit(2423.123, 30000.42),
    };
    // act
    final result = LimitsMapper().fromJson(tJson);
    // assert
    expect(result, wantLimits);
  });
}
