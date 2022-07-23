import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:avencia/logic/core/error.dart';
import 'package:http/http.dart' as http;

class NoTokenException implements Exception {}

/// Adds the Authorization header using [AuthFacade] (therefore can throw [NoTokenException])
/// + sets contentType, responseType
/// + throws NetworkException if status code is not 200
class AuthHTTPClient extends http.BaseClient {
  final AuthFacade _authFacade;
  final http.Client _inner;
  AuthHTTPClient(this._authFacade, this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await _getTokenOrThrow();
    request.headers['contentType'] = "application/json";
    request.headers['responseType'] = "application/json";
    request.headers['Authorization'] = "Bearer $token";

    print(request);

    final streamedResp = await _inner.send(request);
    if (streamedResp.statusCode != 200) {
      final response = await http.Response.fromStream(streamedResp);
      throw NetworkException(response.statusCode, response.body);
    }
    return streamedResp;
  }

  Future<String> _getTokenOrThrow() => _authFacade.getToken().then(
        (tokenOption) => tokenOption.fold(
          () => throw NoTokenException(),
          (token) => token,
        ),
      );
}
