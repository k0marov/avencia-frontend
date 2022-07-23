import 'dart:convert';

import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  test("should convert a valid fixture to a wallet entity", () async {
    // arrange
    final tJson = json.decode(fixture("wallet.json"));
    const Wallet wantWallet = {
      "USD": 1200.5,
      "RUB": 30000,
      "BTC": 0.001,
    };
    // act
    final result = WalletMapper().fromJson(tJson);
    // assert
    expect(result, wantWallet);
  });
}
