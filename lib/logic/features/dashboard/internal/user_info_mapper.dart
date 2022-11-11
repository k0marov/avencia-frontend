import 'package:avencia/logic/features/dashboard/internal/values.dart';
import 'package:avencia/logic/features/wallets/internal/wallets_mapper.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

import '../../history/internal/history_mapper.dart';

class FullUserInfoMapper implements OutMapper<FullUserInfo> {
  final WalletsMapper _wallets;
  final HistoryMapper _history;
  const FullUserInfoMapper(this._wallets, this._history);

  @override
  FullUserInfo fromJson(Map<String, dynamic> json) => FullUserInfo(
        wallets: _wallets.fromJson(json["wallets"]),
        history: _history.fromJson(json["history"]),
      );
}
