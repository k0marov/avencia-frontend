import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/transactions/internal/transaction_code_mapper.dart';
import 'package:avencia/logic/transactions/transaction_code_getter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../shared/helpers.dart';

class MockAuthClient extends Mock implements AuthHTTPClient {}

class MockCodeMapper extends Mock implements TransactionCodeMapper {}

void main() {
  late MockAuthClient mockClient;
  late MockCodeMapper mockMapper;
  late TransactionCodeGetter sut;
  setUp(() {
    mockClient = MockAuthClient();
    mockMapper = MockCodeMapper();
    sut = newTransactionCodeGetter(mockClient, mockMapper);
  });

  final tTransactionType = randomBool() ? TransactionType.deposit : TransactionType.withdrawal;
  final wantUri =
      Uri.https(apiHost, genTransactionCodeEndpoint, {transactionTypeKey: transactionTypeValue(tTransactionType)});

  final tJson = randomJson();
  final tCode = randomTransactionCode();

  test("should get json from http and then decode it using mapper", () async {
    // arrange
    when(() => mockClient.get(wantUri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(tJson)).thenReturn(tCode);
    // act
    final result = await sut(tTransactionType);
    // assert
    expect(result, Right(tCode));
  });
}
