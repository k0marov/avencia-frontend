import 'package:avencia/config/const.dart';
import 'package:avencia/logic/core/money_mapper.dart';
import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/currencies/internal/currencies_mapper.dart';
import 'package:avencia/logic/features/currencies/internal/exchange_rates_mapper.dart';
import 'package:avencia/logic/features/currencies/usecases.dart';
import 'package:avencia/logic/features/dashboard/usecases.dart';
import 'package:avencia/logic/features/history/internal/history_mapper.dart';
import 'package:avencia/logic/features/history/usecases.dart';
import 'package:avencia/logic/features/user/kyc/internal/status_mapper.dart';
import 'package:avencia/logic/features/user/kyc/usecases.dart';
import 'package:avencia/logic/features/wallets/internal/wallet_creation_mapper.dart';
import 'package:avencia/logic/features/wallets/internal/wallets_mapper.dart';
import 'package:avencia/logic/features/wallets/usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
import 'package:helpers/logic/entity/created_id_mapper.dart';
import 'package:helpers/logic/entity/network_crud.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/entity/unique_network_crud.dart';
import 'package:helpers/logic/forms/form_cubit.dart';
import 'package:helpers/logic/http/auth_http_client.dart';
import 'package:helpers/logic/theme_brightness/get_theme_brightness_stream_usecase.dart';
import 'package:helpers/logic/theme_brightness/toggle_theme_brightness_usecase.dart';
import 'package:helpers/logic/uploader/uploader.dart';
import 'package:helpers/ui/errors/bloc_exception_listener.dart';
import 'package:helpers/ui/forms/form_widget.dart';
import 'package:helpers/ui/general/simple_cubit_builder.dart';
import 'package:http/http.dart' as http;
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'logic/features/auth/auth_facade.dart';
import 'logic/features/dashboard/internal/user_info_mapper.dart';
import 'logic/features/history/internal/transaction_source_mapper.dart';
import 'logic/features/transactions/internal/meta_transaction_mapper.dart';
import 'logic/features/transactions/internal/transaction_code_mapper.dart';
import 'logic/features/transactions/internal/values.dart';
import 'logic/features/transactions/state_management/transaction_code_cubit.dart';
import 'logic/features/transactions/usecases.dart';
import 'logic/features/transfer/internal /transfer_mapper.dart';
import 'logic/features/transfer/state_management/transfer_cubit.dart';
import 'logic/features/transfer/usecases.dart';
import 'logic/features/user/kyc/internal/state_management/kyc_cubit.dart';
import 'logic/features/user/user_details/internal/mappers.dart';
import 'logic/features/user/user_details/internal/user_details.dart';
import 'logic/features/user/user_details/user_details_crud.dart';

class UIDeps {
  final AuthFacade authFacade;

  final TransferUseCase transfer;
  final TransferCubitFactory transferCubitFactory;

  final StartTransactionUseCase startTransaction;
  final TransactionCodeCubit Function(TransactionCode code) transCodeCubitFactory;

  final KycCubit Function() passportCubitFactory;

  final FormCubit<UserDetails> Function() userDetailsFormFactory;

  final GetThemeBrightnessStreamUseCase getBrightness;
  final ToggleThemeBrightnessUseCase toggleBrightness;

  final GetHistoryUseCase getHistory;

  final CreateWalletUseCase createWallet;
  final GetWalletsUseCase getWallets;

  final GetFullUserInfoUseCase getUserInfo;

  final USDTotalGetter getUsdTotal;

  final SimpleBuilderFactory simpleBuilder;
  final FormWidgetFactory formWidget;
  final BlocExceptionListenerFactory exceptionListener;

  UIDeps._(
    this.authFacade,
    this.transfer,
    this.transferCubitFactory,
    this.startTransaction,
    this.transCodeCubitFactory,
    this.passportCubitFactory,
    this.userDetailsFormFactory,
    this.getBrightness,
    this.toggleBrightness,
    this.getHistory,
    this.createWallet,
    this.getWallets,
    this.getUserInfo,
    this.getUsdTotal,
    this.simpleBuilder,
    this.formWidget,
    this.exceptionListener,
  );
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final authClientFactory = newAuthHTTPClientFactory(authFacade);
  final nucFactory = NetworkUseCaseFactory(apiHost, authClientFactory(http.Client()));

  final startTransaction =
      newStartTransactionUseCase(nucFactory, MetaTransactionMapper(), TransactionCodeMapper());

  final transfer = newTransferUseCase(nucFactory, TransferMapper());
  final transferCubitFactory = newTransferCubitFactory();

  final networkCrud = NetworkCRUD(nucFactory);
  final uniqueNetworkCrud = UniqueNetworkCRUD(nucFactory);

  final readUserDetails = newUserDetailsReader(uniqueNetworkCrud, UserDetailsMapper());
  final updateUserDetails = newUserDetailsUpdater(uniqueNetworkCrud, UserDetailsMapper());

  final uploader = newUploader(authClientFactory, apiHost);

  final exceptionListener = newBlocExceptionListenerFactory(authFacade);
  final formWidget = newFormWidgetFactory(exceptionListener);
  final simpleBuilder = newSimpleBuilderFactory(exceptionListener);

  final sp = RxSharedPreferences.getInstance();

  final moneyMapper = MoneyMapper();

  final createWallet =
      newCreateWalletUseCase(nucFactory, WalletCreationMapper(), CreatedIdMapper());
  final walletMapper = WalletMapper(moneyMapper);
  final walletsMapper = WalletsMapper(walletMapper);
  final getWallets = newGetWalletsUseCase(nucFactory, walletsMapper);

  final historyMapper = HistoryMapper(TransactionSourceMapper(), moneyMapper);
  final getHistory = newGetHistoryUseCase(nucFactory, historyMapper);

  final getUserInfo = newGetUserInfoUseCase(
    nucFactory,
    FullUserInfoMapper(walletsMapper, historyMapper),
  );

  final getUsdTotal =
      newUSDTotalGetter(await getRates(nucFactory, CurrenciesMapper(), ExchangeRatesMapper()));

  uiDeps = UIDeps._(
    authFacade,
    transfer,
    transferCubitFactory,
    startTransaction,
    (code) => TransactionCodeCubit(code),
    () => KycCubit(
      StatusDeps(
        newKycStatusGetter(uniqueNetworkCrud, passportStatusEndpoint, StatusMapper()),
        newKycStatusSubmitter(nucFactory, passportStatusEndpoint),
      ),
      ImagesDeps(const [passportBackEndpoint, passportFrontEndpoint], uploader),
      AgreementsDeps(2),
    ),
    () => FormCubit<UserDetails>(readUserDetails, updateUserDetails),
    newGetThemeBrightnessUseCase(sp),
    newToggleThemeBrightnessUseCase(sp),
    getHistory,
    createWallet,
    getWallets,
    getUserInfo,
    getUsdTotal,
    simpleBuilder,
    formWidget,
    exceptionListener,
  );
}
