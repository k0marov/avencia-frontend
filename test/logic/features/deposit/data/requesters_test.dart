import 'dart:convert';

import 'package:avencia/logic/core/auth_http_client.dart';
import 'package:avencia/logic/core/endpoints.dart';
import 'package:avencia/logic/features/deposit/data/mappers.dart';
import 'package:avencia/logic/features/deposit/data/requesters.dart';
import 'package:avencia/logic/features/deposit/domain/contracts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../shared/helpers.dart';

class MockAuthClient extends Mock implements AuthHTTPClient {}

class MockCodeMapper extends Mock implements TransactionCodeMapper {}

void main() {
  late MockAuthClient mockClient;
  late MockCodeMapper mockMapper;
  late DepositCodeRequester sut;
  setUp(() {
    mockClient = MockAuthClient();
    mockMapper = MockCodeMapper();
    sut = newDepositCodeRequester(mockClient, mockMapper);
  });

  final endpoint = depositGenerateCodeEndpoint();
  final uri = endpoint.toURL(apiHost);
  final tJson = {"x": randomString(), "y": randomString()};
  final tCode = randomTransactionCode();

  test("should get json from http and then decode it using mapper", () async {
    // arrange
    when(() => mockClient.get(uri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(tJson)).thenReturn(tCode);
    // act
    final result = await sut();
    // assert
    expect(result, tCode);
  });
  test("should rethrow http client exceptions", () async {
    // arrange
    final tException = Exception();
    when(() => mockClient.get(uri)).thenThrow(tException);
    // assert
    expect(sut, throwsA(tException));
  });
  test("should rethrow mapper exceptions", () async {
    // arrange
    final tException = Exception();
    when(() => mockClient.get(uri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(any())).thenThrow(tException);
    // assert
    expect(sut, throwsA(tException));
  });
}
