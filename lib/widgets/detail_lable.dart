import 'package:flutter/material.dart';

/// ゲーム詳細用のラベルを作成
class DetailLabel extends StatelessWidget {
  const DetailLabel({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  /// ラベルのタイトル
  final String title;

  /// ラベルの本文
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: 80.0,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                ),
              )),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white60,
              ),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
