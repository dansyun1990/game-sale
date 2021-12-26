import 'package:flutter/material.dart';

class CardTag extends StatelessWidget {
  const CardTag(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.backgroundColor})
      : super(key: key);

  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? backgroundColor
            : textColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).brightness == Brightness.light
              ? textColor
              : Colors.white,
        ),
      ),
    );
  }
}
