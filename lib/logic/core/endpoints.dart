import 'package:equatable/equatable.dart';

const apiHost = "avencia.skomarov.com";

class EndpointQuery extends Equatable {
  final String endpoint;
  final Map<String, dynamic> query;
  @override
  List get props => [endpoint, query];

  const EndpointQuery(this.endpoint, [this.query = const <String, dynamic>{}]);

  Uri toURL(String host) => Uri.https(host, endpoint, query);
}

EndpointQuery depositGenerateCodeEndpoint() => const EndpointQuery("/deposit/gen-code");
