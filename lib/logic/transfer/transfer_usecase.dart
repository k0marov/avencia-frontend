import 'package:avencia/config/const.dart';
import 'package:avencia/logic/core/entity/network_use_case_factory.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_data.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:dartz/dartz.dart';

typedef TransferUseCase = Future<Either<Exception, void>> Function(TransferData);

TransferUseCase newTransferUseCase(
  NetworkUseCaseFactory nuc,
  TransferMapper mapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: mapper,
      getUri: (_, host) => Uri.https(host, transferEndpoint, {}),
      method: "POST",
      outMapper: NoOutMapper(),
    );
