import 'dart:convert';

import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class Mapper<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class InpMapper<T> {
  Map<String, dynamic> toJson(T inp);
}

typedef URIGetter<Inp> = Uri Function(Inp);

typedef BaseNetworkUseCase<Inp, Out> = Future<Either<Exception, Out>> Function(
    Inp inp);

BaseNetworkUseCase<Inp, Out> newBaseNetworkUseCase<Inp, Out>(
    InpMapper<Inp> inpMapper,
    URIGetter<Inp> getUri,
    String method,
    AuthHTTPClient client,
    Mapper<Out> mapper) {
  return (inp) {
    return withExceptionHandling(() async {
      final uri = getUri(inp);
      final request = http.Request(method, uri);
      request.body = json.encode(inpMapper.toJson(inp));
      final respStream = await client.send(request);
      final resp = await http.Response.fromStream(respStream);
      final respBody = json.decode(resp.body);
      return mapper.fromJson(respBody);
    });
  };
}
