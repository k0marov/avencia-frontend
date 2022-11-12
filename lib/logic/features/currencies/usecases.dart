import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';

import '../../core/money.dart';

typedef USDConverter = double Function(Money);
typedef USDTotalGetter = double Function(Wallets);

USDConverter newUSDConverter(ExchangeRates rates) => (m) {
      if (m.currency == baseCurrency) return m.amount;
      final rate = rates[m.currency];
      if (rate == null) throw Exception("the currency ${m.currency} is not supported");
      return m.amount / rate;
    };

USDTotalGetter newUSDTotalGetter(USDConverter convert) => (wallets) => wallets.wallets.fold(
      0.0,
      (prev, wallet) => prev + convert(wallet.money),
    );
