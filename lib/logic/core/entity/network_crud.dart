import 'entity.dart';
import 'network_use_case_factory.dart';

class NetworkCRUD {
  final NetworkUseCaseFactory _networkFactory;
  const NetworkCRUD(this._networkFactory);

  Creator<V> newCreator<V extends Value>({
    required String endpoint,
    required InpMapper<V> inpMap,
    required OutMapper<Entity<V>> outMap,
  }) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: inpMap,
      getUri: (v, host) => Uri.https(host, endpoint),
      method: "POST",
      outMapper: outMap,
    );
  }

  Reader<V> newReader<V extends Value>({
    required String endpoint,
    required bool includeId,
    required OutMapper<Entity<V>> outMap,
  }) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (id, host) => Uri.https(endpoint + (includeId ? id : ""), host),
      method: "GET",
      outMapper: outMap,
    );
  }

  Updater<V> newUpdater<V extends Value>({
    required String endpoint,
    required bool includeId,
    required InpMapper<Entity<V>> inpMap,
  }) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: inpMap,
      getUri: (Entity<V> e, String host) => Uri.https(endpoint + (includeId ? e.id : ""), host),
      method: "PATCH",
      outMapper: NoOutMapper(),
    );
  }

  Deleter<V> newDeleter<V extends Value>({required String endpoint}) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (id, host) => Uri.https(endpoint + id, host),
      method: "DELETE",
      outMapper: NoOutMapper(),
    );
  }
}
