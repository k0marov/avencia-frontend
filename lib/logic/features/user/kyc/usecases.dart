import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';
import 'package:helpers/logic/http/http.dart';

import 'internal/status.dart';

typedef KycStatusGetter = Future<UseCaseRes<Status>> Function();
typedef KycStatusSubmitter = Future<UseCaseRes<void>> Function();

KycStatusGetter newKycStatusGetter(
  UniqueNetworkCRUD crud,
  String endpoint,
  OutMapper<Status> map,
) {
  return crud.newReader(
    endpoint: endpoint,
    outMap: map,
  );
}

KycStatusSubmitter newKycStatusSubmitter(NetworkUseCaseFactory nuc, String endpoint) {
  final uc = nuc.newBaseNetworkUseCase(
    inpMapper: NoInpMapper(),
    getUri: (_, host) => Uri.https(host, endpoint),
    method: HTTPMethods.patch,
    outMapper: NoOutMapper(),
  );
  return () => uc(null);
}
