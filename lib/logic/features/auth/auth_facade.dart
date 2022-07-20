import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFacade {
  Stream<String?> getTokenStream();
  Future<String?> getToken();
  Future<void> logout();
}

class FirebaseAuthFacade implements AuthFacade {
  final FirebaseAuth _fbAuth;
  const FirebaseAuthFacade(this._fbAuth);
  @override
  Future<String?> getToken() async => _fbAuth.currentUser?.getIdToken();

  @override
  Stream<String?> getTokenStream() => _fbAuth.userChanges().asyncMap((user) async => user?.getIdToken());

  @override
  Future<void> logout() => _fbAuth.signOut();
}
