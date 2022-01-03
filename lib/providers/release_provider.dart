import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/models/release_games.dart';
import 'package:game_sale/repositories/release_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームリリース一覧保持のProvider
final releaseProvider = StateNotifierProvider.family<ReleaseGamesStateNotifier,
    ReleaseGames, GamePlatform>(
  (ref, platform) => ReleaseGamesStateNotifier(platform.key),
);

/// ゲームリリース一覧保持・検索を行うStateNotifier
class ReleaseGamesStateNotifier extends StateNotifier<ReleaseGames> {
  ReleaseGamesStateNotifier(String? platform)
      : super(const ReleaseGames(releaseGames: [])) {
    fetchFirst(platform);
  }

  /// ゲームリリース用リポジトリインスタンス生成
  final _releaseRepository = ReleaseRepository();

  /// 現在取得している最後のドキュメントを保持
  DocumentSnapshot? _fetchedLastDoc;

  /// 1ページごとに読み込む数
  static const pageSize = 4;

  ///　最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirst(String? platform) async {
    state = state.copyWith(isLoading: true);
    final snapshots =
        await _releaseRepository.getReleaseGames(pageSize, platform: platform);

    if (snapshots.size == 0) {
      return;
    }

    _fetchedLastDoc = snapshots.docs.last;
    final releaseGames = snapshots.docs.map((doc) => doc.data()).toList();
    state = state.copyWith(releaseGames: releaseGames, isLoading: false);
  }

  /// 次のドキュメントを読み込む
  Future<void> fetchPosts(String? platform) async {
    state = state.copyWith(isLoading: true);
    final snapshots = await _releaseRepository.getReleaseGames(pageSize,
        startAfter: _fetchedLastDoc, platform: platform);

    if (snapshots.size == 0) {
      return;
    }

    _fetchedLastDoc = snapshots.docs.last;
    final releaseGames = [
      ...state.releaseGames,
      ...snapshots.docs.map((doc) => doc.data()).toList()
    ];
    state = state.copyWith(releaseGames: releaseGames, isLoading: false);
  }
}
