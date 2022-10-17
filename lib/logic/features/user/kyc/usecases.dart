import 'package:avencia/config/const.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';

import 'internal/status.dart';

typedef PassportSubmitter = Future<UseCaseRes<void>> Function();

UniqueReader<Status> newPassportStatusGetter(
  UniqueNetworkCRUD crud,
  OutMapper<Status> map,
) {
  return crud.newReader(
    endpoint: passportStatusEndpoint,
    outMap: map,
  );
}

// PassportSubmitter newPassportSubmitter(NetworkCRUD crud, InpMapper<Entity<Status>> map) => () {
//   crud.newUpdater(endpoint: passportStatusEndpoint, includeId: false, inpMap: map)(Entity<Status>());
// }
