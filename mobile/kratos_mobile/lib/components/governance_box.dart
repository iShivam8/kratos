// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/currency_box.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/models/currency.dart';
import 'package:kratos_mobile/providers/swap_provider.dart';

class GovernanceBox extends HookConsumerWidget {
  const GovernanceBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromController = useTextEditingController();
    final toController = useTextEditingController();

    fromController.addListener(() {
      toController.text = fromController.text;
    });

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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Governance Tokens',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: orngCol.withOpacity(0.1),
                    ),
                    child: Text(
                      'Slippage: 4%',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                CurrencyBox(
                  title: "From",
                  currency: currencyAll[2],
                  allowChange: false,
                  controller: fromController,
                ),
                CurrencyBox(
                  title: "To",
                  currency: Currency(
                    name: 'Governance Kratos',
                    symbol: 'GKRT',
                    imageUrl: 'assets/klpt_logo.png',
                  ),
                  allowChange: false,
                  controller: toController,
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
                  isPressed.value ? 'Converted!' : 'Convert',
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
