part of 'transfer_cubit.dart';

class TransferState extends Equatable {
  final String email;
  final Currency currency;
  final MoneyAmount amount;
  final Exception? exception;

  @override
  List get props => [email, currency, amount, exception];

  const TransferState(this.email, this.currency, this.amount, [this.exception]);

  TransferState withEmail(String email) => TransferState(email, currency, amount, exception);
  TransferState withCurrency(Currency currency) => TransferState(email, currency, amount, exception);
  TransferState withAmount(MoneyAmount amount) => TransferState(email, currency, amount, exception);
  TransferState withException(Exception exception) => TransferState(email, currency, amount, exception);
}
