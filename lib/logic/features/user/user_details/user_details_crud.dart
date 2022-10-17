import 'package:avencia/config/const.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';

import 'internal/user_details.dart';

UniqueReader<UserDetails> newUserDetailsReader(UniqueNetworkCRUD crud, OutMapper<UserDetails> map) {
  return crud.newReader(
    endpoint: userDetailsEndpoint,
    outMap: map,
  );
}

UniqueUpdater<UserDetails> newUserDetailsUpdater(
    UniqueNetworkCRUD crud, InpMapper<UserDetails> map) {
  return crud.newUpdater(
    endpoint: userDetailsEndpoint,
    inpMap: map,
  );
}
