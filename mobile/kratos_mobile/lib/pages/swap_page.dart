import 'package:flutter/material.dart';
import 'package:kratos_mobile/components/swap_box.dart';
import 'package:kratos_mobile/constants.dart';

class SwapPage extends StatelessWidget {
  const SwapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            orngCol.withOpacity(0.01),
          ],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SwapBox()],
      ),
    );
  }
}
