import 'package:avencia/config/const.dart';
import 'package:avencia/logic/auth/auth_facade.dart';
import 'package:avencia/logic/transactions/internal/meta_transaction_mapper.dart';
import 'package:avencia/logic/transactions/internal/transaction_code_mapper.dart';
import 'package:avencia/logic/transactions/presentation/transaction_code_cubit/transaction_code_cubit.dart';
import 'package:avencia/logic/transactions/start_transaction_usecase.dart';
import 'package:avencia/logic/transfer/internal%20/transfer_mapper.dart';
import 'package:avencia/logic/transfer/presentation/transfer_cubit.dart';
import 'package:avencia/logic/transfer/transfer_usecase.dart';
import 'package:avencia/logic/user_details/internal/mappers.dart';
import 'package:avencia/logic/user_details/user_details_crud.dart';
import 'package:avencia/logic/user_info/get_user_info_usecase.dart';
import 'package:avencia/logic/user_info/internal/limits_mapper.dart';
import 'package:avencia/logic/user_info/internal/user_info_mapper.dart';
import 'package:avencia/logic/user_info/internal/wallet_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/auth/auth_http_client.dart';
import 'package:helpers/logic/entity/network_crud.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/forms/form_cubit.dart';
import 'package:helpers/logic/theme_brightness/get_theme_brightness_stream_usecase.dart';
import 'package:helpers/logic/theme_brightness/toggle_theme_brightness_usecase.dart';
import 'package:helpers/ui/errors/bloc_exception_listener.dart';
import 'package:helpers/ui/forms/form_widget.dart';
import 'package:helpers/ui/general/simple_cubit_builder.dart';
import 'package:http/http.dart' as http;
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'logic/user_details/internal/user_details.dart';

class UIDeps {
  final AuthFacade authFacade;
  final GetUserInfoUseCase getUserInfo;

  final TransferUseCase transfer;
  final TransferCubitFactory transferCubitFactory;

  final StartTransactionUseCase startTransaction;
  final TransactionCodeCubitFactory transCodeCubitFactory;

  final ToggleThemeBrightnessUseCase toggleThemeBrightness;
  final GetThemeBrightnessStreamUseCase getThemeBrightnessStream;

  final FormCubit<UserDetails> Function() userDetailsFormFactory;

  final SimpleBuilderFactory simpleBuilder;
  final FormWidgetFactory formWidget;
  final BlocExceptionListenerFactory exceptionListener;

  UIDeps._(
    this.authFacade,
    this.getUserInfo,
    this.transfer,
    this.transferCubitFactory,
    this.startTransaction,
    this.transCodeCubitFactory,
    this.toggleThemeBrightness,
    this.getThemeBrightnessStream,
    this.userDetailsFormFactory,
    this.simpleBuilder,
    this.formWidget,
    this.exceptionListener,
  );
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final httpClient = AuthHTTPClient(authFacade, http.Client());
  final nucFactory = NetworkUseCaseFactory(apiHost, httpClient);

  final startTransaction =
      newStartTransactionUseCase(nucFactory, MetaTransactionMapper(), TransactionCodeMapper());
  final transCodeCubitFactory = newTransactionCodeCubitFactory();

  final getUserInfo =
      newGetUserInfoUseCase(nucFactory, UserInfoMapper(LimitsMapper(), WalletMapper()));

  final transfer = newTransferUseCase(nucFactory, TransferMapper());
  final transferCubitFactory = newTransferCubitFactory();

  final sharedPrefs = RxSharedPreferences.getInstance();
  final toggleTheme = newToggleThemeBrightnessUseCase(sharedPrefs);
  final getThemeStream = newGetThemeBrightnessUseCase(sharedPrefs);

  final networkCrud = NetworkCRUD(nucFactory);

  final readUserDetails = newUserDetailsReader(networkCrud, UserDetailsMapper());
  final updateUserDetails = newUserDetailsUpdater(networkCrud, UserDetailsMapper());

  final exceptionListener = newBlocExceptionListenerFactory(authFacade);
  final formWidget = newFormWidgetFactory(exceptionListener);
  final simpleBuilder = newSimpleBuilderFactory(exceptionListener);

  uiDeps = UIDeps._(
    authFacade,
    getUserInfo,
    transfer,
    transferCubitFactory,
    startTransaction,
    transCodeCubitFactory,
    toggleTheme,
    getThemeStream,
    () => FormCubit<UserDetails>(readUserDetails, updateUserDetails, ""),
    simpleBuilder,
    formWidget,
    exceptionListener,
  );
}
