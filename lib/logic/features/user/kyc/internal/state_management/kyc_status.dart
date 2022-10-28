part of 'kyc_cubit.dart';

typedef StatusState = BlocState<Status>;

class StatusDeps extends Equatable {
  final KycStatusGetter statusGetter;
  final KycStatusSubmitter statusUpdater;
  @override
  List get props => [statusGetter, statusUpdater];
  const StatusDeps(this.statusGetter, this.statusUpdater);
}

StatusState initialStatusState(StatusDeps deps) => const None();

extension StatusExtension on KycCubit {
  void refreshStatus() => _load();
  void submit() async {
    emit(state.withStatus(None()));
    _statusDeps.statusUpdater().then(
          (result) => result.fold(
            (e) => emit(state.withStatus(Some(Left(e)))),
            (s) => _load(),
          ),
        );
  }

  void _load() async {
    emit(state.withStatus(None()));
    final status = await _statusDeps.statusGetter();
    emit(state.withStatus(Some(status)));
  }
}
