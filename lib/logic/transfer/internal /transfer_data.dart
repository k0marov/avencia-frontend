import 'package:avencia/logic/core/money/money.dart';
import 'package:equatable/equatable.dart';

class TransferData extends Equatable {
  final String recipientEmail;
  final Money money;
  @override
  List get props => [recipientEmail, money];
  const TransferData(this.recipientEmail, this.money);
}
