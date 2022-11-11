import 'package:avencia/logic/features/history/internal/entities.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final Wallets wallets;
  final History history;
  @override
  List get props => [wallets, history];

  const UserInfo({required this.wallets, required this.history});
}
