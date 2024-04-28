import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/providers/swap_provider.dart';

class CurrencyModal extends HookConsumerWidget {
  final String title;

  const CurrencyModal({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyNotifier = ref.watch(swapStateNotifierProvider.notifier);

    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Choose a currency',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final currency = currencyAll[index];

                return GestureDetector(
                  onTap: () {
                    if (title.toLowerCase() == 'from') {
                      currencyNotifier.setFromCurrency(currency);
                    } else {
                      currencyNotifier.setToCurrency(currency);
                    }
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 32,
                              width: 32,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(currency.imageUrl),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              (currency.symbol),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            currency.name.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.white24),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
