import 'package:flutter/material.dart';

/// カード用のタグを作成
class CardTag extends StatelessWidget {
  const CardTag({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  /// タグの名称
  final String text;

  /// タグの色
  final Color textColor;

  /// タグの背景色
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
