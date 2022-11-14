import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/errors/errors.dart';

class FirebaseAuthFacade implements AuthFacade {
  final FirebaseAuth _fbAuth;
  const FirebaseAuthFacade(this._fbAuth);

  @override
  Future<AuthState> getState() => _userToState(_fbAuth.currentUser);

  @override
  Stream<AuthState> getStateStream() => _fbAuth.userChanges().asyncMap(_userToState);

  @override
  Future<Either<Exception, void>> updateDisplayName(String displayName) => withExceptionHandling(
        () async => _fbAuth.currentUser?.updateDisplayName(displayName),
      );

  @override
  Future<Either<Exception, EmailState>> getEmail() => withExceptionHandling(() async {
        final user = _fbAuth.currentUser;
        if (user == null) throw UnauthenticatedException();
        await user.reload();
        return EmailState(
          user.email ?? "",
          user.emailVerified,
        );
      });
  @override
  Future<Either<Exception, void>> verifyEmail() => withExceptionHandling(
        () async => _fbAuth.currentUser?.sendEmailVerification(),
      );

  Future<Either<Exception, void>> updateEmail(String email) => withExceptionHandling(
        () async => _fbAuth.currentUser?.verifyBeforeUpdateEmail(email),
      );

  @override
  Future<Either<Exception, void>> logout() => withExceptionHandling(() async => _fbAuth.signOut());

  Future<AuthState> _userToState(User? user) async => user != null
      ? Some(UserState(
          displayName: user.displayName,
          emailState: EmailState(user.email, user.emailVerified),
          token: await user.getIdToken(),
        ))
      : None();

  @override
  Future<Either<Exception, void>> refresh() => withExceptionHandling(() async {
        await _fbAuth.currentUser?.reload();
      });
}
