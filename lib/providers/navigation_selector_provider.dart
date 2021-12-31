import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ナビゲーションバー選択状態保持のProvider
final navigationSelectorProvider = StateProvider<int>((ref) => 0);
