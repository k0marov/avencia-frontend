part of 'kyc_cubit.dart';

typedef StatusState = BlocState<Status>;

class StatusDeps extends Equatable {
  final KycStatusGetter statusGetter;
  final KycStatusSubmitter statusUpdater;
  @override
  List get props => [statusGetter, statusUpdater];
  const StatusDeps(this.statusGetter, this.statusUpdater);
}

class StatusExtension {
  final StatusDeps _deps;
  final ExtensionEmitter<StatusState> _emit;
  final StateGetter<StatusState> _getState;

  StatusExtension(this._deps, this._emit, this._getState) {
    refresh();
  }

  static StatusState initialState(StatusDeps deps) => None();

  void refresh() => _load();
  void submit() async {
    _emit(None());
    _deps.statusUpdater().then(
          (result) => result.fold(
            (e) => _emit(Some(Left(e))),
            (s) => _load(),
          ),
        );
  }

  void _load() async {
    _emit(None());
    print("getting status");
    _emit(Some(await _deps.statusGetter()));
  }
}
