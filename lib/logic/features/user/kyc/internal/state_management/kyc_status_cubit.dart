import 'package:avencia/logic/features/user/kyc/usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:helpers/logic/core.dart';

import '../status.dart';

typedef KycStatusState = BlocState<Status>;

class KycStatusCubit extends Cubit<KycStatusState> {
  final KycStatusGetter _statusGetter;
  final KycStatusSubmitter _statusUpdater;
  KycStatusCubit(this._statusGetter, this._statusUpdater) : super(None()) {
    _load();
  }

  void refresh() => _load();
  void submit() async {
    emit(None());
    _statusUpdater().then(
      (result) => result.fold(
        (e) => emit(Some(Left(e))),
        (s) => _load(),
      ),
    );
  }

  void _load() async {
    emit(None());
    emit(Some(await _statusGetter()));
  }
}
