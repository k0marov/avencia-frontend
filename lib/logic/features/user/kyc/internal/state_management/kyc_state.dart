part of 'kyc_cubit.dart';

abstract class KycState extends Equatable {
  const KycState();
}

class KycInitial extends KycState {
  @override
  List<Object> get props => [];
}
