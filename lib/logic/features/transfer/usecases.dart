import 'package:avencia/config/const.dart';
import 'package:dartz/dartz.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

import 'internal /transfer_data.dart';
import 'internal /transfer_mapper.dart';

typedef TransferUseCase = Future<Either<Exception, void>> Function(TransferData);

TransferUseCase newTransferUseCase(
  NetworkUseCaseFactory nuc,
  TransferMapper mapper,
) =>
    nuc.newBaseNetworkUseCase(
      inpMapper: mapper,
      getUri: (_, host) => Uri.https(host, transferEndpoint, {}),
      method: HTTPMethods.post,
      outMapper: NoOutMapper(),
    );
