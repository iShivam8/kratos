import 'package:flutter/material.dart';
import 'package:kratos_mobile/models/Currency.dart';

@immutable
class SwapState {
  final Currency fromCurrency;
  final Currency toCurrency;

  const SwapState({
    this.fromCurrency = const Currency(
      name: 'Stacks',
      symbol: 'STX',
      imageUrl:
          'https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880',
    ),
  });
}
