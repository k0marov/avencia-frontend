import 'package:avencia/logic/features/user/user_info/internal/wallet_mapper.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

import 'entities.dart';
import 'limits_mapper.dart';

class UserInfoMapper implements OutMapper<UserInfo> {
  final LimitsMapper limitsMapper;
  final WalletMapper walletMapper;

  UserInfoMapper(this.limitsMapper, this.walletMapper);

  @override
  UserInfo fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["id"],
        limits: limitsMapper.fromJson(json["limits"]),
        wallet: walletMapper.fromJson(json["wallet"]),
      );
}
