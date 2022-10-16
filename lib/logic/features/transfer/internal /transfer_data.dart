import 'package:equatable/equatable.dart';

import '../../../core/money.dart';

class TransferData extends Equatable {
  final String recipientEmail;
  final Money money;
  @override
  List get props => [recipientEmail, money];
  const TransferData(this.recipientEmail, this.money);
}
