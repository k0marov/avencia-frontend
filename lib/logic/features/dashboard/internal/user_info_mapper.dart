import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/logic/features/wallets/internal/wallets_mapper.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

import '../../history/internal/history_mapper.dart';

class UserInfoMapper implements OutMapper<UserInfo> {
  final WalletsMapper _wallets;
  final HistoryMapper _history;
  const UserInfoMapper(this._wallets, this._history);

  @override
  UserInfo fromJson(Map<String, dynamic> json) => UserInfo(
        wallets: _wallets.fromJson(json["wallets"]),
        history: _history.fromJson(json["history"]),
      );
}
