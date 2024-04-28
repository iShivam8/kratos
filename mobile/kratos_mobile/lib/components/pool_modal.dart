import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/currency_box.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/models/currencyPair.dart';

class PoolModal extends HookConsumerWidget {
  final CurrencyPair currencyPair;

  const PoolModal({super.key, required this.currencyPair});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromController = useTextEditingController();
    final toController = useTextEditingController();

    fromController.addListener(() {
      double amt = double.tryParse(fromController.text) ?? 0;

      double fullAmt = amt * currencyPair.currency1.price;

      print('fullAmt: $fullAmt');

      toController.text =
          (fullAmt / currencyPair.currency2.price).toStringAsFixed(4);
    });

    final isPressed = useState(false);

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
            controller: fromController,
          ),
          const SizedBox(height: 12),
          CurrencyBox(
            title: 'Token 2',
            currency: currencyPair.currency2,
            allowChange: false,
            controller: toController,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              isPressed.value = !isPressed.value;
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isPressed.value ? Colors.green : orngCol,
              ),
              alignment: Alignment.center,
              child: Text(
                isPressed.value ? 'Confirmed!' : 'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
