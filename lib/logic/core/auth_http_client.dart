import 'package:avencia/logic/core/error/failures.dart';
import 'package:avencia/logic/features/auth/auth_facade.dart';
import 'package:http/http.dart' as http;

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
    final response = await _inner.send(request);
    if (response.statusCode != 200) {
      final fullResponse = await http.Response.fromStream(response);
      throw NetworkFailure(fullResponse.statusCode, fullResponse.body);
    }
    return response;
  }

  Future<String> _getTokenOrThrow() async {
    final token = await _authFacade.getToken();
    if (token == null) throw NoTokenFailure();
    return token;
  }
}
