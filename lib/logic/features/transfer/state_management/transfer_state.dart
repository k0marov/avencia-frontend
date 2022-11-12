part of 'transfer_cubit.dart';

class TransferState extends Equatable {
  final TransferData data;
  final bool walletsShown;
  // False means the send button has not been pressed yet
  // True means the transfer was completed successfully
  final BlocState<bool> sendState;

  @override
  List get props => [data, walletsShown, sendState];

  const TransferState(this.data, this.walletsShown, [this.sendState = const Some(Right(false))]);

  TransferState copyWith({
    TransferData? data,
    bool? walletsShown,
    BlocState<bool>? sendState,
  }) =>
      TransferState(
        data ?? this.data,
        walletsShown ?? this.walletsShown,
        sendState ?? this.sendState,
      );
}
