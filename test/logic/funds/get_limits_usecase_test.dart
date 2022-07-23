import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/funds/get_limits_usecase.dart';
import 'package:avencia/logic/funds/internal/entities.dart';
import 'package:avencia/logic/funds/internal/limits_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../shared/helpers.dart';

class MockAuthClient extends Mock implements AuthHTTPClient {}

class MockLimitsMapper extends Mock implements LimitsMapper {}

void main() {
  late MockAuthClient mockClient;
  late MockLimitsMapper mockMapper;
  late GetLimitsUseCase sut;
  setUp(() {
    mockClient = MockAuthClient();
    mockMapper = MockLimitsMapper();
    sut = newGetLimitsUseCase(mockClient, mockMapper);
  });

  final wantUri = Uri.https(apiHost, getLimitsEndpoint, {});

  final tJson = randomJson();
  final Limits tLimits = {
    "USD": Limit(1200.5, 1455.6),
    "RUB": Limit(30000.5, 12005),
  };

  test("should get json from http and then decode it using mapper", () async {
    // arrange
    when(() => mockClient.get(wantUri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(tJson)).thenReturn(tLimits);
    // act
    final result = await sut();
    // assert
    expect(result, Right(tLimits));
  });
}
