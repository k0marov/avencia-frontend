import 'package:avencia/logic/features/currencies/currencies.dart';
import 'package:avencia/logic/features/wallets/internal/values.dart';

typedef USDTotalGetter = double Function(Wallets);

USDTotalGetter newUSDTotalGetter(ExchangeRates rates) => (wallets) {
      double total = 0.0;
      for (final w in wallets.wallets) {
        final rate = rates[w.money.currency];
        if (rate == null) continue; // TODO: maybe throw an error
        total += w.money.amount / rate;
      }
      return total;
    };
