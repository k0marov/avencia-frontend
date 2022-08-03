import 'dart:convert';

import 'package:avencia/logic/core/money.dart';
import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void baseInpMapperTest<Entity>({
  required Entity entity,
  required InpMapper<Entity> mapper,
  required String fixtureName,
}) {
  test("should convert an entity to valid json", () async {
    // act
    final result = mapper.toJson(entity);
    // assert
    final wantJson = json.decode(fixture(fixtureName));
    expect(result, wantJson);
  });
}
