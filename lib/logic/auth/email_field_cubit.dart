import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

typedef EmailFieldState = Option<Either<Exception, EmailState>>;

class EmailFieldCubit extends Cubit<EmailFieldState> {
  final AuthFacade _auth;
  EmailFieldCubit(this._auth) : super(None()) {
    _load();
  }

  void _load() {
    _auth.getEmail().then(
          (res) => res.fold(
            (e) => emit(Some(Left(e))),
            (email) => emit(Some(Right(email))),
          ),
        );
  }
}
