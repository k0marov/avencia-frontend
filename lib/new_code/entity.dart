import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'network_use_case_factory.dart';

class Entity<V extends Value> extends Equatable {
  final String id;
  final V o;
  @override
  List get props => [...o.props, id];
  const Entity(this.id, this.o);
}

typedef Value = Equatable;

typedef Creator<V extends Value> = Future<Either<Exception, Entity<V>>> Function(V);
typedef Reader<V extends Value> = Future<Either<Exception, Entity<V>>> Function(String id);
typedef Updater<V extends Value> = Future<Either<Exception, void>> Function(Entity<V>);
typedef Deleter<V extends Value> = Future<Either<Exception, void>> Function(String id);

class NetworkCRUD {
  final NetworkUseCaseFactory _networkFactory;
  const NetworkCRUD(this._networkFactory);

  Creator<V> newCreator<V extends Value>(String endpoint, InpMapper<V> inpMap, OutMapper<Entity<V>> outMap) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: inpMap,
      getUri: (v, host) => Uri.https(host, endpoint),
      method: "POST",
      outMapper: outMap,
    );
  }

  Reader<V> newReader<V extends Value>(String endpoint, OutMapper<Entity<V>> outMap) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (id, host) => Uri.https(endpoint + id, host),
      method: "GET",
      outMapper: outMap,
    );
  }

  Updater<V> newUpdater<V extends Value>(String endpoint, InpMapper<Entity<V>> inpMap) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: inpMap,
      getUri: (Entity<V> e, String host) => Uri.https(endpoint + e.id, host),
      method: "PATCH",
      outMapper: NoOutMapper(),
    );
  }

  Deleter<V> newDeleter<V extends Value>(String endpoint) {
    return _networkFactory.newBaseNetworkUseCase(
      inpMapper: NoInpMapper(),
      getUri: (id, host) => Uri.https(endpoint + id, host),
      method: "DELETE",
      outMapper: NoOutMapper(),
    );
  }
}
