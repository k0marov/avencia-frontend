import 'dart:convert';

import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class InpMapper<T> {
  Map<String, dynamic> toJson(T inp);
}

abstract class OutMapper<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class FullMapper<T> implements InpMapper<T>, OutMapper<T> {}


typedef URIGetter<Inp> = Uri Function(Inp);

typedef BaseNetworkUseCase<Inp, Out> = Future<Either<Exception, Out>> Function(
    Inp inp);


class NoInpMapper<T> implements InpMapper<T> {
  @override
  Map<String, dynamic> toJson(T inp) {
    return {}; 
  }
}

class NoOutMapper implements OutMapper<void> {
  @override 
  void fromJson(Map<String, dynamic> json) {} 
}

BaseNetworkUseCase<Inp, Out> newBaseNetworkUseCase<Inp, Out>({
    required InpMapper<Inp> inpMapper,
    required URIGetter<Inp> getUri,
    required String method,
    required AuthHTTPClient client,
    required OutMapper<Out> outMapper}) {
  return (inp) {
    return withExceptionHandling(() async {
      final uri = getUri(inp);
      final request = http.Request(method, uri);
      request.body = json.encode(inpMapper.toJson(inp));
      final respStream = await client.send(request);
      final resp = await http.Response.fromStream(respStream);
      final respBody = json.decode(resp.body);
      return outMapper.fromJson(respBody);
    });
  };
}
