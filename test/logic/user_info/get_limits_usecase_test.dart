import 'dart:convert';

import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/user_info/get_user_info_usecase.dart';
import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../shared/helpers.dart';

class MockAuthClient extends Mock implements AuthHTTPClient {}

class MockUserInfoMapper extends Mock implements UserInfoMapper {}

void main() {
  late MockAuthClient mockClient;
  late MockUserInfoMapper mockMapper;
  late GetUserInfoUseCase sut;
  setUp(() {
    mockClient = MockAuthClient();
    mockMapper = MockUserInfoMapper();
    sut = newGetLimitsUseCase(mockClient, mockMapper);
  });

  final wantUri = Uri.https(apiHost, getUserInfoEndpoint, {});

  final tJson = randomJson();
  const Limits tLimits = {
    "USD": Limit(1200.5, 1455.6),
    "RUB": Limit(30000.5, 12005),
  };
  const Wallet tWallet = {
    "BTC": 0.001,
    "RUB": 42000,
    "USD": 300,
  };
  final tUserInfo = UserInfo(
    userId: randomString(),
    limits: tLimits,
    wallet: tWallet,
  );

  test("should get json from http and then decode it using mapper", () async {
    // arrange
    when(() => mockClient.get(wantUri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
    when(() => mockMapper.fromJson(tJson)).thenReturn(tUserInfo);
    // act
    final result = await sut();
    // assert
    expect(result, Right(tUserInfo));
  });
}
