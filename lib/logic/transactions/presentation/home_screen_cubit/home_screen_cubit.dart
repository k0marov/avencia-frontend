import 'package:bloc/bloc.dart';

enum HomeScreenState {
  initial,
  depositing,
  withdrawing,
}

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial);

  void depositPressed() => emit(HomeScreenState.depositing);
  void withdrawPressed() => emit(HomeScreenState.withdrawing);
  void finishPressed() => emit(HomeScreenState.initial);
}
