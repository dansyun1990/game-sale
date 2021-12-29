import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 気に入り一覧ページを作成
class FavoritePage extends HookConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorite),
      ),
    );
  }
}
