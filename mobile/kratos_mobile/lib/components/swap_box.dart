// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/currency_box.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/providers/swap_provider.dart';

class SwapBox extends HookConsumerWidget {
  const SwapBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyState = ref.watch(swapStateNotifierProvider);

    final isPressed = useState(false);

    return Center(
      child: Container(
        // height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black87,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Swap',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    child: Text(
                      'Slippage: 4%',
                      style: TextStyle(color: Colors.grey),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: orngCol.withOpacity(0.1),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                CurrencyBox(
                  title: "From",
                  currency: currencyState.fromCurrency,
                ),
                CurrencyBox(
                  title: "To",
                  currency: currencyState.toCurrency,
                ),
              ],
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () {
                isPressed.value = !isPressed.value;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutBack,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: isPressed.value ? Colors.green : orngCol,
                ),
                alignment: Alignment.center,
                child: Text(
                  isPressed.value ? 'Swapped!' : 'Swap',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
