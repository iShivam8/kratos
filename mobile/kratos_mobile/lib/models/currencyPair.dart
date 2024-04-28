import 'package:kratos_mobile/models/currency.dart';
import 'package:kratos_mobile/providers/swap_provider.dart';

class CurrencyPair {
  final Currency currency1;
  final Currency currency2;
  final String name;

  CurrencyPair({
    required this.currency1,
    required this.currency2,
    required this.name,
  });
}

var currPairs = [
  CurrencyPair(
    currency1: currencyAll[1],
    currency2: currencyAll[3],
    name: 'BTC-SBTC',
  ),
  CurrencyPair(
    currency1: currencyAll[0],
    currency2: currencyAll[3],
    name: 'STX-SBTC',
  ),
];
