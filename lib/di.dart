import 'package:avencia/logic/core/auth_http_client.dart';
import 'package:avencia/logic/features/auth/auth_facade.dart';
import 'package:avencia/logic/features/auth/auth_gate_stream.dart';
import 'package:avencia/logic/features/deposit/data/mappers.dart';
import 'package:avencia/logic/features/deposit/data/requesters.dart';
import 'package:avencia/logic/features/deposit/domain/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerLazySingleton<AuthFacade>(() => FirebaseAuthFacade(FirebaseAuth.instance));
  sl.registerLazySingleton<AuthGateStreamFactory>(() => authGateStreamFactoryImpl(sl<AuthFacade>().getTokenStream));
  final client = AuthHTTPClient(sl<AuthFacade>(), http.Client());
  final depRequester = newDepositCodeRequester(client, TransactionCodeMapper());
  sl.registerLazySingleton(() => newDepositCodeGetter(depRequester));
}
