import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalePriceText extends StatelessWidget {
  const SalePriceText(
      {Key? key, required this.salePrice, required this.basePrice})
      : super(key: key);

  final int salePrice;
  final int basePrice;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: NumberFormat.simpleCurrency(locale: 'ja').format(salePrice),
            style: const TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                NumberFormat.simpleCurrency(locale: 'ja').format(basePrice),
                style: const TextStyle(
                  fontSize: 9.0,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
