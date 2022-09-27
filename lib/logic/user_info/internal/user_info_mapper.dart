import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';

import '../../core/entity/network_use_case_factory.dart';

// TODO: test this

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
