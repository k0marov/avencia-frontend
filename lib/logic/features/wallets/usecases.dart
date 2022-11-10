import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';
import 'package:avencia/logic/features/wallets/internal/wallet_creation_mapper.dart';
import 'package:avencia/logic/features/wallets/internal/wallets_mapper.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/created_id_mapper.dart';
import 'package:helpers/logic/entity/entity.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

typedef CreateWalletUseCase = Future<UseCaseRes<CreatedId>> Function(WalletCreationVal);
typedef GetWalletsUseCase = Future<UseCaseRes<Wallets>> Function();

CreateWalletUseCase newCreateWalletUseCase(
  NetworkUseCaseFactory nuc,
  WalletCreationMapper createMapper,
  CreatedIdMapper idMapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: createMapper,
      getUri: (_, host) => Uri.https(host, createWalletEndpoint),
      method: HTTPMethods.post,
      outMapper: idMapper,
    );

GetWalletsUseCase newGetWalletsUseCase(
  NetworkUseCaseFactory nuc,
  WalletsMapper walletsMapper,
) =>
    () => nuc.newBaseNetworkUseCase(
          inpMapper: NoInpMapper(),
          getUri: (_, host) => Uri.https(host, getWalletsEndpoint),
          method: HTTPMethods.get,
          outMapper: walletsMapper,
        )(null);
