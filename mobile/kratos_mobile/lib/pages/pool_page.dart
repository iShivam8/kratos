import 'package:flutter/material.dart';
import 'package:kratos_mobile/components/pool_table.dart';
import 'package:kratos_mobile/constants.dart';

class PoolPage extends StatelessWidget {
  const PoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            orngCol.withOpacity(0.01),
          ],
        ),
      ),
      child: PoolTable(),
    );
  }
}
