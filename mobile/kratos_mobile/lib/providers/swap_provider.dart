import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/models/currency.dart';

@immutable
class SwapState {
  final Currency fromCurrency;
  final Currency toCurrency;

  const SwapState({
    required this.fromCurrency,
    required this.toCurrency,
  });

  SwapState copyWith({
    Currency? fromCurrency,
    Currency? toCurrency,
  }) {
    return SwapState(
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
    );
  }
}

class SwapStateNotifier extends StateNotifier<SwapState> {
  SwapStateNotifier()
      : super(
          SwapState(
            fromCurrency: currencyAll[0],
            toCurrency: currencyAll[1],
          ),
        );

  void setFromCurrency(Currency currency) {
    state = state.copyWith(fromCurrency: currency);
  }

  void setToCurrency(Currency currency) {
    state = state.copyWith(toCurrency: currency);
  }
}

final swapStateNotifierProvider =
    StateNotifierProvider<SwapStateNotifier, SwapState>(
  (ref) => SwapStateNotifier(),
);

const currencyLogo = {
  'STX': 'assets/stx_logo.png',
  'BTC': 'assets/bitcoin_logo.png',
  'KLPT': 'assets/klpt_logo.png',
  'SBTC': 'assets/sbtc_logo.jpg',
};

const currencyAll = [
  Currency(
    name: "Stacks",
    symbol: "STX",
    imageUrl: 'assets/stx_logo.png',
    price: 2.55,
  ),
  Currency(
    name: "Bitcoin",
    symbol: "BTC",
    imageUrl: 'assets/bitcoin_logo.png',
    price: 63595.90,
  ),
  Currency(
    name: "Kratos LPT",
    symbol: "KLPT",
    imageUrl: 'assets/klpt_logo.png',
    price: 1,
  ),
  Currency(
    name: "SBTC",
    symbol: "SBTC",
    imageUrl: 'assets/sbtc_logo.jpg',
    price: 63595.90,
  )
];
