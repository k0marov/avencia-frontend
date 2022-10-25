import 'package:avencia/config/const.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';
import 'package:helpers/logic/http/http.dart';

import 'internal/status.dart';

typedef PassportStatusGetter = Future<UseCaseRes<Status>> Function();
typedef PassportSubmitter = Future<UseCaseRes<void>> Function();

PassportStatusGetter newPassportStatusGetter(
  UniqueNetworkCRUD crud,
  OutMapper<Status> map,
) {
  return crud.newReader(
    endpoint: passportStatusEndpoint,
    outMap: map,
  );
}

PassportSubmitter newPassportSubmitter(NetworkUseCaseFactory nuc) {
  final uc = nuc.newBaseNetworkUseCase(
    inpMapper: NoInpMapper(),
    getUri: (_, host) => Uri.https(host, passportStatusEndpoint),
    method: HTTPMethods.patch,
    outMapper: NoOutMapper(),
  );
  return () => uc(null);
}
