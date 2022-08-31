import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/network_usecase.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:dartz/dartz.dart';

typedef TransferUseCase = Future<Either<Exception, void>> Function(TransferData);

TransferUseCase newTransferUseCase(
  AuthHTTPClient httpClient,
  TransferMapper mapper,
) =>
    newBaseNetworkUseCase(
      inpMapper: mapper,
      getUri: (_) => Uri.https(apiHost, transferEndpoint, {}),
      method: "POST",
      client: httpClient,
      outMapper: NoOutMapper(),
    );
