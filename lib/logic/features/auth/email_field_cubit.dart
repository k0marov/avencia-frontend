import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/core.dart';

enum CurrentAction {
  updating,
  verifying,
}

typedef EmailFieldState = BlocState<LoadedState>;

class LoadedState extends Equatable {
  final EmailState current;
  final String edited;
  @override
  List get props => [current, edited];
  CurrentAction get action =>
      current.email == edited ? CurrentAction.verifying : CurrentAction.updating;
  bool get actionEnabled => !(action == CurrentAction.verifying && current.isVerified);
  const LoadedState(this.current, this.edited);
  LoadedState withEdited(String edited) => LoadedState(current, edited);
}

class EmailFieldCubit extends Cubit<EmailFieldState> {
  final AuthFacade _auth;
  EmailFieldCubit(this._auth) : super(const None()) {
    _load();
  }

  void edited(String newVal) {
    state.fold(
      () => null,
      (some) => some.fold(
        (e) => null,
        (loaded) => emit(Some(Right(loaded.withEdited(newVal)))),
      ),
    );
  }

  void actionPressed() {
    state.fold(
      () => null,
      (some) => some.fold(
        (e) => null,
        (loaded) async => (loaded.action == CurrentAction.updating
                ? await _auth.updateEmail(loaded.edited)
                : await _auth.verifyEmail())
            .fold(
          (e) => emit(Some(Left(e))),
          (success) => null,
        ),
      ),
    );
  }

  void _load() {
    _auth.getEmail().then(
          (res) => res.fold(
            (e) => emit(Some(Left(e))),
            (email) => emit(Some(Right(LoadedState(email, email.email)))),
          ),
        );
  }
}
