enum AuthState {
  authenticated,
  unauthenticated,
}

typedef TokenStreamGetter = Stream<String?> Function();
typedef AuthGateStream = Stream<AuthState>;
typedef AuthGateStreamFactory = AuthGateStream Function();

AuthGateStreamFactory authGateStreamFactoryImpl(
  TokenStreamGetter getTokenStream,
) =>
    () => getTokenStream().map(
          (token) => token == null
              ? AuthState.unauthenticated
              : AuthState.authenticated,
        );
