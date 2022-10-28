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

extension AgreementsExtension on KycCubit {
  void toggleOn(int index) {
    final changed = state.agreements.toList();
    changed[index] = !changed[index];
    emit(state.withAgreements(changed));
  }

  bool _allAgreed() => state.agreements.every((a) => a);
}
