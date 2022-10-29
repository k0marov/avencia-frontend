part of 'kyc_cubit.dart';

class AgreementsDeps extends Equatable {
  final int agreementsCount;
  @override
  List get props => [agreementsCount];
  const AgreementsDeps(this.agreementsCount);
}

typedef AgreementsState = List<bool>;

AgreementsState initialAgreementsState(AgreementsDeps deps) => List.filled(
      deps.agreementsCount,
      false,
    );

class AgreementsExtension {
  final AgreementsDeps _deps;
  final ExtensionEmitter<AgreementsState> _emit;
  final StateGetter<AgreementsState> _getState;
  const AgreementsExtension(this._deps, this._emit, this._getState);

  static AgreementsState initialState(AgreementsDeps deps) => List.filled(
        deps.agreementsCount,
        false,
      );

  void toggleOn(int index) {
    final changed = _getState().toList();
    changed[index] = !changed[index];
    _emit(changed);
  }

  bool _allAgreed() => _getState().every((a) => a);
}
