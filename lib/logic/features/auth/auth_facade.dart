import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/errors/errors.dart';

class FirebaseAuthFacade implements AuthFacade {
  final FirebaseAuth _fbAuth;
  const FirebaseAuthFacade(this._fbAuth);
  @override
  Future<Option<AuthToken>> getToken() => _userToToken(_fbAuth.currentUser);

  @override
  Stream<Option<AuthToken>> getTokenStream() => _fbAuth.authStateChanges().asyncMap(_userToToken);

  @override
  Future<Either<Exception, EmailState>> getEmail() => withExceptionHandling(() async {
        final user = _fbAuth.currentUser;
        if (user == null) throw UnauthenticatedException();
        return EmailState(
          user.email ?? "",
          user.emailVerified,
        );
      });
  @override
  Future<Either<Exception, void>> verifyEmail() => withExceptionHandling(
        () async => _fbAuth.currentUser?.sendEmailVerification(),
      );
  @override
  Future<Either<Exception, void>> updateEmail(String email) => withExceptionHandling(
        () async => _fbAuth.currentUser?.verifyBeforeUpdateEmail(email),
      );

  @override
  Future<Either<Exception, void>> logout() => withExceptionHandling(() async => _fbAuth.signOut());

  Future<Option<AuthToken>> _userToToken(User? user) async =>
      user != null ? Some(await user.getIdToken()) : const None();

  @override
  Future<Either<Exception, void>> refresh() => withExceptionHandling(() async {
        await _fbAuth.currentUser?.reload();
      });
}