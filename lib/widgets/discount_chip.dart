import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';

class DiscountChip extends StatelessWidget {
  const DiscountChip({
    Key? key,
    required this.discountPercent,
    required this.discountedUntil,
  }) : super(key: key);

  final int discountPercent;
  final String discountedUntil;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      backgroundColor: Colors.red,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '-$discountPercent%',
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: '\n'),
            TextSpan(
              text: S.of(context).daysLeft(DateTime.parse(discountedUntil)
                  .difference(DateTime.now())
                  .inDays),
              style: const TextStyle(fontSize: 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
