import 'package:equatable/equatable.dart';

import '../../../../core/money.dart';

class Limit extends Equatable {
  final MoneyAmount withdrawn;
  final MoneyAmount max;

  @override
  List get props => [withdrawn, max];

  const Limit(this.withdrawn, this.max);
}

typedef Limits = Map<Currency, Limit>;
typedef Wallet = Map<Currency, MoneyAmount>;

class UserInfo extends Equatable {
  final String userId;
  final Limits limits;
  final Wallet wallet;
  @override
  List get props => [userId, limits, wallet];
  const UserInfo({required this.userId, required this.limits, required this.wallet});
}
