import 'package:avencia/logic/features/auth/auth_gate_stream.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should properly transform the token stream", () async {
    // arrange
    final tTokenStream = Stream.fromIterable(["asdf", null, "xyz", null, null, "abc"]);
    // act
    final tGotStream = authGateStreamFactoryImpl(() => tTokenStream)();
    // assert
    expect(
      tGotStream,
      emitsInOrder(
        [
          AuthState.authenticated,
          AuthState.unauthenticated,
          AuthState.authenticated,
          AuthState.unauthenticated,
          AuthState.unauthenticated,
          AuthState.authenticated,
        ],
      ),
    );
  });
}
