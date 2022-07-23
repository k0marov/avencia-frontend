import 'package:avencia/logic/user_info/internal/entities.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';

// TODO: test this

class UserInfoMapper {
  final LimitsMapper limitsMapper;
  final WalletMapper walletMapper;

  UserInfoMapper(this.limitsMapper, this.walletMapper);

  UserInfo fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["user_id"],
        limits: limitsMapper.fromJson(json["limits"]),
        wallet: walletMapper.fromJson(json["wallet"]),
      );
}
