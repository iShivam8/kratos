import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/currency_box.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/models/currencyPair.dart';

class PoolModal extends HookConsumerWidget {
  final CurrencyPair currencyPair;

  const PoolModal({super.key, required this.currencyPair});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 700,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Add Liquidity',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CurrencyBox(
            title: 'Token 1',
            currency: currencyPair.currency1,
            allowChange: false,
          ),
          const SizedBox(height: 12),
          CurrencyBox(
            title: 'Token 2',
            currency: currencyPair.currency2,
            allowChange: false,
          ),
          const Spacer(),
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [orngCol, orngCol],
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
