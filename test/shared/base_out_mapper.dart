import 'dart:convert';

import 'package:avencia/logic/core/network_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void baseOutMapperTest<Entity>({
  required Entity entity,
  required OutMapper<Entity> mapper,
  required String fixtureName,
}) {
  test("should convert a fixture to an entity", () async {
    // arrange
    final tJson = json.decode(fixture(fixtureName));
    // act
    final result = mapper.fromJson(tJson);
    // assert
    expect(result, entity);
  });
}
