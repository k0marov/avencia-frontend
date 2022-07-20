import 'dart:math';

import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:avencia/logic/features/deposit/presentation/deposit_code_cubit.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tExpiresIn = Duration(minutes: 5);
  final code = TransactionCode("4242", DateTime.now().add(tExpiresIn));
  test("should set state with computed expiration time", () async {
    // arrange
    final sut = DepositCodeCubit(code);
    // act
    // assert
    expect(sut.state.code, code);
    expect((sut.state.leftToExpire - tExpiresIn).abs().inSeconds, lessThan(3));
  });
  test("should emit new leftToExpire for every second", () async {
    fakeAsync((async) {
      // arrange
      final sut = DepositCodeCubit(code);
      final tElapsed = Duration(seconds: Random().nextInt(50));
      // act
      async.elapse(tElapsed);
      // assert
      expect((sut.state.leftToExpire - (tExpiresIn - tElapsed)).abs().inSeconds, lessThan(3));
    });
  });
}
