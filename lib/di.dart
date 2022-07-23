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
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'logic/theme_brightness/get_theme_brightness_stream_usecase.dart';
import 'logic/theme_brightness/toggle_theme_brightness_usecase.dart';

class UIDeps {
  final AuthFacade authFacade;
  final GetUserInfoUseCase getUserInfo;

  final StartTransactionUseCase startTransaction;
  final TransactionCodeCubitFactory transCodeCubitFactory;

  final ToggleThemeBrightnessUseCase toggleThemeBrightness;
  final GetThemeBrightnessStreamUseCase getThemeBrightnessStream;

  UIDeps._(this.authFacade, this.getUserInfo, this.startTransaction, this.transCodeCubitFactory,
      this.toggleThemeBrightness, this.getThemeBrightnessStream);
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final httpClient = AuthHTTPClient(authFacade, http.Client());

  final startTransaction = newStartTransactionUseCase(httpClient, TransactionCodeMapper());
  final transCodeCubitFactory = newTransactionCodeCubitFactory();

  final getUserInfo = newGetUserInfoUseCase(httpClient, UserInfoMapper(LimitsMapper(), WalletMapper()));

  final sharedPrefs = RxSharedPreferences.getInstance();
  final toggleTheme = newToggleThemeBrightnessUseCase(sharedPrefs);
  final getThemeStream = newGetThemeBrightnessUseCase(sharedPrefs);

  uiDeps = UIDeps._(authFacade, getUserInfo, startTransaction, transCodeCubitFactory, toggleTheme, getThemeStream);
}
