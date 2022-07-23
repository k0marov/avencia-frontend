import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:avencia/logic/auth/auth_http_client.dart';
import 'package:avencia/logic/transactions/internal/transaction_code_mapper.dart';
import 'package:avencia/logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import 'package:avencia/logic/transactions/start_transaction_usecase.dart';
import 'package:avencia/logic/user_info/get_user_info_usecase.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class UIDeps {
  final AuthFacade authFacade;
  final GetUserInfoUseCase getUserInfo;
  final StartTransactionUseCase startTransaction;
  final TransactionCodeCubitFactory transCodeCubitFactory;

  UIDeps._(this.authFacade, this.getUserInfo, this.startTransaction, this.transCodeCubitFactory);
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final httpClient = AuthHTTPClient(authFacade, http.Client());

  final startTransaction = newStartTransactionUseCase(httpClient, TransactionCodeMapper());
  final transCodeCubitFactory = newTransactionCodeCubitFactory();

  final getUserInfo = newGetUserInfoUseCase(httpClient, UserInfoMapper(LimitsMapper(), WalletMapper()))

  uiDeps = UIDeps._(authFacade, getUserInfo, startTransaction, transCodeCubitFactory);
}
