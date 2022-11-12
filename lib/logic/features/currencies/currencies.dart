import 'package:avencia/config/const.dart';
import 'package:avencia/logic/features/currencies/internal/currencies_mapper.dart';
import 'package:avencia/logic/features/currencies/internal/exchange_rates_mapper.dart';
import 'package:avencia/logic/features/currencies/values.dart';
import 'package:helpers/logic/entity/network_use_case_factory.dart';
import 'package:helpers/logic/http/http.dart';

import '../../core/money.dart';

const _baseCurrency = "USD";

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

typedef ExchangeRates = Map<Currency, double>;

Future<ExchangeRates> getRates(
    NetworkUseCaseFactory nuc, CurrenciesMapper currMapper, ExchangeRatesMapper ratesMapper) async {
  final usecase = nuc.newBaseNetworkUseCase(
    inpMapper: currMapper,
    getUri: (_, host) => Uri.https(host, getExchangeRatesEndpoint),
    method: HTTPMethods.get,
    outMapper: ratesMapper,
  );
  final currencies =
      SupportedCurrencies.currencies.where((curr) => curr.code != _baseCurrency).toList();
  final result = await usecase(currencies);
  return result.fold(
    (exception) => throw exception,
    (rates) => rates,
  );
}
