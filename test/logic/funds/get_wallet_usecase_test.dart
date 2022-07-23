import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/funds/get_wallet_usecase.dart';
import 'package:avencia/logic/funds/internal/entities.dart';
import 'package:avencia/logic/funds/internal/wallet_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../shared/helpers.dart';

class MockAuthClient extends Mock implements AuthHTTPClient {}

class MockWalletMapper extends Mock implements WalletMapper {}

void main() {
  late MockAuthClient mockClient;
  late MockWalletMapper mockMapper;
  late GetWalletUseCase sut;
  setUp(() {
    mockClient = MockAuthClient();
    mockMapper = MockWalletMapper();
    sut = newGetWalletUseCase(mockClient, mockMapper);
  });

  final wantUri = Uri.https(apiHost, getWalletEndpoint, {});

  final tJson = randomJson();
  final Wallet tWallet = {
    "USD": 100.42,
    "RUB": 32000,
  };

  test("should get json from http and then decode it using mapper", () async {
    // arrange
    when(() => mockClient.get(wantUri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(tJson)).thenReturn(tWallet);
    // act
    final result = await sut();
    // assert
    expect(result, Right(tWallet));
  });
}
