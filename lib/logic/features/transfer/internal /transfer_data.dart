import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:equatable/equatable.dart';

import '../../../core/money.dart';

class TransferData extends Equatable {
  final String recipientEmail;
  final Wallet myWallet;
  final MoneyAmount money;
  @override
  List get props => [recipientEmail, myWallet, money];
  const TransferData(this.recipientEmail, this.myWallet, this.money);

  TransferData copyWith({
    String? recipientEmail,
    Wallet? myWallet,
    MoneyAmount? money,
  }) =>
      TransferData(
        recipientEmail ?? this.recipientEmail,
        myWallet ?? this.myWallet,
        money ?? this.money,
      );
}
