import 'package:avencia/config/const.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/entity/entity.dart';
import 'package:helpers/logic/entity/network_crud.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';

import 'internal/status.dart';

// TODO: change the NetworkCRUD to get rid of the requirement to have an id, since it is not suitable for Status

typedef PassportSubmitter = Future<UseCaseRes<void>> Function();

Reader<Status> newPassportStatusGetter(NetworkCRUD crud, OutMapper<Entity<Status>> map) {
  return crud.newReader(
    endpoint: passportStatusEndpoint,
    includeId: false,
    outMap: map,
  );
}

// PassportSubmitter newPassportSubmitter(NetworkCRUD crud, InpMapper<Entity<Status>> map) => () {
//   crud.newUpdater(endpoint: passportStatusEndpoint, includeId: false, inpMap: map)(Entity<Status>());
// }
