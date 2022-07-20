import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/transactions/presentation/transaction_code_cubit.dart';
import 'package:avencia/logic/transactions/service.dart';
import 'package:avencia/logic/transactions/transaction_code_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class UIDeps {
  final AuthFacade authFacade;
  final TransactionCodeGetter transCodeGetter;
  final TransactionCodeCubitFactory transCodeCubitFactory;

  UIDeps._(this.authFacade, this.transCodeGetter, this.transCodeCubitFactory);
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final httpClient = AuthHTTPClient(authFacade, http.Client());
  final transCodeGetter = newTransactionCodeGetter(httpClient, TransactionCodeMapper());
  final transCodeCubitFactory = newTransactionCodeCubitFactory();

  uiDeps = UIDeps._(authFacade, transCodeGetter, transCodeCubitFactory);
}
