import 'package:avencia/config/const.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';

import 'internal/values.dart';

UniqueReader<Address> newAddressReader(UniqueNetworkCRUD crud, OutMapper<Address> map) {
  return crud.newReader(
    endpoint: addressEndpoint,
    outMap: map,
  );
}

UniqueUpdater<Address> newAddressUpdater(UniqueNetworkCRUD crud, InpMapper<Address> map) {
  return crud.newUpdater(
    endpoint: addressEndpoint,
    inpMap: map,
  );
}
