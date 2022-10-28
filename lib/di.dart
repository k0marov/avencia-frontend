import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/user/kyc/internal/status_mapper.dart';
import 'package:avencia/logic/features/user/kyc/usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpers/logic/auth/auth_facade.dart';
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
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'logic/features/auth/auth_facade.dart';
import 'logic/features/transactions/internal/meta_transaction_mapper.dart';
import 'logic/features/transactions/internal/transaction_code_mapper.dart';
import 'logic/features/transactions/internal/values.dart';
import 'logic/features/transactions/state_management/transaction_code_cubit/transaction_code_cubit.dart';
import 'logic/features/transactions/usecases.dart';
import 'logic/features/transfer/internal /transfer_mapper.dart';
import 'logic/features/transfer/state_management/transfer_cubit.dart';
import 'logic/features/transfer/usecases.dart';
import 'logic/features/user/kyc/internal/state_management/kyc_cubit.dart';
import 'logic/features/user/user_details/internal/mappers.dart';
import 'logic/features/user/user_details/internal/user_details.dart';
import 'logic/features/user/user_details/user_details_crud.dart';
import 'logic/features/user/user_info/internal/limits_mapper.dart';
import 'logic/features/user/user_info/internal/user_info_mapper.dart';
import 'logic/features/user/user_info/internal/wallet_mapper.dart';
import 'logic/features/user/user_info/usecases.dart';

class UIDeps {
  final AuthFacade authFacade;
  final GetUserInfoUseCase getUserInfo;

  final TransferUseCase transfer;
  final TransferCubitFactory transferCubitFactory;

  final StartTransactionUseCase startTransaction;
  final TransactionCodeCubit Function(TransactionCode code) transCodeCubitFactory;

  final ToggleThemeBrightnessUseCase toggleThemeBrightness;
  final GetThemeBrightnessStreamUseCase getThemeBrightnessStream;

  final KycCubit Function() passportCubitFactory;

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
    this.passportCubitFactory,
    this.userDetailsFormFactory,
    this.simpleBuilder,
    this.formWidget,
    this.exceptionListener,
  );
}

late final UIDeps uiDeps;

Future<void> initialize() async {
  final authFacade = FirebaseAuthFacade(FirebaseAuth.instance);
  final authClientFactory = newAuthHTTPClientFactory(authFacade);
  final nucFactory = NetworkUseCaseFactory(apiHost, authClientFactory);

  final startTransaction =
      newStartTransactionUseCase(nucFactory, MetaTransactionMapper(), TransactionCodeMapper());

  final getUserInfo =
      newGetUserInfoUseCase(nucFactory, UserInfoMapper(LimitsMapper(), WalletMapper()));

  final transfer = newTransferUseCase(nucFactory, TransferMapper());
  final transferCubitFactory = newTransferCubitFactory();

  final sharedPrefs = RxSharedPreferences.getInstance();
  final toggleTheme = newToggleThemeBrightnessUseCase(sharedPrefs);
  final getThemeStream = newGetThemeBrightnessUseCase(sharedPrefs);

  final networkCrud = NetworkCRUD(nucFactory);
  final uniqueNetworkCrud = UniqueNetworkCRUD(nucFactory);

  final readUserDetails = newUserDetailsReader(uniqueNetworkCrud, UserDetailsMapper());
  final updateUserDetails = newUserDetailsUpdater(uniqueNetworkCrud, UserDetailsMapper());

  final uploader = newUploader(authClientFactory, apiHost);

  final exceptionListener = newBlocExceptionListenerFactory(authFacade);
  final formWidget = newFormWidgetFactory(exceptionListener);
  final simpleBuilder = newSimpleBuilderFactory(exceptionListener);

  uiDeps = UIDeps._(
    authFacade,
    getUserInfo,
    transfer,
    transferCubitFactory,
    startTransaction,
    (code) => TransactionCodeCubit(code),
    toggleTheme,
    getThemeStream,
    () => KycCubit(
      ImagesDeps(const [passportBackEndpoint, passportFrontEndpoint], uploader),
      StatusDeps(
        newKycStatusGetter(uniqueNetworkCrud, passportStatusEndpoint, StatusMapper()),
        newKycStatusSubmitter(nucFactory, passportStatusEndpoint),
      ),
      AgreementsDeps(2),
    ),
    () => FormCubit<UserDetails>(readUserDetails, updateUserDetails),
    simpleBuilder,
    formWidget,
    exceptionListener,
  );
}
