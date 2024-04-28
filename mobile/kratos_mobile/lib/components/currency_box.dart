// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kratos_mobile/components/currency_modal.dart';
import 'package:kratos_mobile/constants.dart';
import 'package:kratos_mobile/models/currency.dart';

class CurrencyBox extends HookConsumerWidget {
  final String title;
  final Currency currency;
  final bool allowChange;
  final TextEditingController? controller;

  const CurrencyBox({
    super.key,
    required this.title,
    required this.currency,
    this.allowChange = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(currency.imageUrl);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: orngCol.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: GestureDetector(
              onTap: allowChange
                  ? () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.black,
                        builder: (BuildContext context) {
                          return CurrencyModal(title: title);
                        },
                      );
                    }
                  : () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Image.asset(
                            currency.imageUrl,
                            color:
                                currency.symbol.toLowerCase().contains("klpt")
                                    ? Colors.blue
                                    : null,
                            colorBlendMode:
                                currency.symbol.toLowerCase().contains("klpt")
                                    ? BlendMode.color
                                    : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        currency.symbol,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      allowChange
                          ? const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.white)
                          : Container()
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(color: Colors.white10),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: '0.0',
                hintStyle: TextStyle(color: Colors.white24, fontSize: 24),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
