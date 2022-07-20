import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef AuthToken = String;

abstract class AuthFacade {
  Stream<Option<AuthToken>> getTokenStream();
  Future<Option<AuthToken>> getToken();
  Future<void> logout();
}

class FirebaseAuthFacade implements AuthFacade {
  final FirebaseAuth _fbAuth;
  const FirebaseAuthFacade(this._fbAuth);
  @override
  Future<Option<AuthToken>> getToken() => _userToToken(_fbAuth.currentUser);

  @override
  Stream<Option<AuthToken>> getTokenStream() => _fbAuth.userChanges().asyncMap(_userToToken);

  @override
  Future<void> logout() => _fbAuth.signOut();

  Future<Option<AuthToken>> _userToToken(User? user) async =>
      user != null ? Some(await user.getIdToken()) : const None();
}
