import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helpers/logic/auth/auth_facade.dart';

enum CurrentAction {
  updating,
  verifying,
}

class EmailCubitState extends Equatable {
  final EmailState current;
  final String edited;
  final Exception? exception;
  @override
  List get props => [current, edited, exception];
  CurrentAction get action =>
      current.email == edited ? CurrentAction.verifying : CurrentAction.updating;
  bool get actionEnabled => !(action == CurrentAction.verifying && current.isVerified);
  const EmailCubitState(this.current, this.edited, [this.exception]);
  EmailCubitState withEdited(String edited) => EmailCubitState(current, edited, exception);
  EmailCubitState withException(Exception exception) => EmailCubitState(current, edited, exception);
}

class EmailFieldCubit extends Cubit<EmailCubitState> {
  final AuthFacade _auth;
  final EmailState _currentState;
  EmailFieldCubit(this._auth, this._currentState)
      : super(EmailCubitState(
          _currentState,
          _currentState.email ?? "",
        ));

  void edited(String newVal) {
    emit(state.withEdited(newVal));
  }

  void actionPressed() async {
    (state.action == CurrentAction.updating
            ? await _auth.updateEmail(state.edited)
            : await _auth.verifyEmail())
        .fold(
      (e) => emit(state.withException(e)),
      (success) => null,
    );
  }
}
