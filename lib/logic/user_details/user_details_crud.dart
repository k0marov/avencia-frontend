import 'package:avencia/config/const.dart';
import 'package:avencia/logic/core/entity/network_crud.dart';

import '../core/entity/entity.dart';
import '../core/entity/network_use_case_factory.dart';
import 'internal/user_details.dart';

Reader<UserDetails> newUserDetailsReader(NetworkCRUD crud, OutMapper<Entity<UserDetails>> map) {
  return crud.newReader(
    endpoint: userDetailsEndpoint,
    includeId: false,
    outMap: map,
  );
}

Updater<UserDetails> newUserDetailsUpdater(NetworkCRUD crud, InpMapper<Entity<UserDetails>> map) {
  return crud.newUpdater(
    endpoint: userDetailsEndpoint,
    includeId: false,
    inpMap: map,
  );
}
