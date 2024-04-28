import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/constants.dart';

class SwapBox extends HookConsumerWidget {
  const SwapBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black54,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Swap',
                    style: TextStyle(color: Colors.white, fontSize: 21),
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
            )
          ],
        ),
      ),
    );
  }
}
