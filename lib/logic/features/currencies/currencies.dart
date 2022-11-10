import 'package:avencia/logic/features/currencies/currency_data.dart';

class SupportedCurrencies {
  static const _currencies = [
    CurrencyData("RUB", "Ruble"),
    CurrencyData("USD", "US Dollar"),
    CurrencyData("GBP", "Great Britain Pound"),
    CurrencyData("BTC", "Bitcoin"),
    CurrencyData("ETH", "Etherium"),
    CurrencyData("LTC", "Lightcoin"),
  ];
  static List<CurrencyData> get currencies => _currencies;

  static CurrencyData? getData(String code) => _currencies.cast<CurrencyData?>().firstWhere(
        (curr) => curr?.code == code,
        orElse: () => null,
      );
}
