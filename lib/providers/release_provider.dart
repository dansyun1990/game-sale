import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/api/firebase_api.dart';
import 'package:game_sale/constants/game_platform.dart';
import 'package:game_sale/models/release_games.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ゲームリリース全部一覧保持のProvider
final releaseAllProvider =
    StateNotifierProvider<ReleaseGamesStateNotifier, ReleaseGames>(
  (ref) => ReleaseGamesStateNotifier(null),
);

/// ゲームリリースPS4一覧保持のProvider
final releasePS4Provider =
    StateNotifierProvider<ReleaseGamesStateNotifier, ReleaseGames>(
  (ref) => ReleaseGamesStateNotifier(GamePlatform.ps4.key),
);

/// ゲームリリースPS5一覧保持のProvider
final releasePS5Provider =
    StateNotifierProvider<ReleaseGamesStateNotifier, ReleaseGames>(
  (ref) => ReleaseGamesStateNotifier(GamePlatform.ps5.key),
);

/// ゲームリリースSwitch一覧保持のProvider
final releaseSwitchProvider =
    StateNotifierProvider<ReleaseGamesStateNotifier, ReleaseGames>(
  (ref) => ReleaseGamesStateNotifier(GamePlatform.nintendoSwitch.key),
);

/// ゲームリリースSteam一覧保持のProvider
final releaseSteamProvider =
    StateNotifierProvider<ReleaseGamesStateNotifier, ReleaseGames>(
  (ref) => ReleaseGamesStateNotifier(GamePlatform.steam.key),
);

/// ゲームリリース一覧保持・検索を行うStateNotifier
class ReleaseGamesStateNotifier extends StateNotifier<ReleaseGames> {
  ReleaseGamesStateNotifier(String? platform)
      : super(const ReleaseGames(releaseGames: [])) {
    fetchFirstPosts(platform);
  }

  /// 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  /// 1ページごとに読み込む数
  static const pageSize = 4;

  ///　最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstPosts(String? platform) async {
    state = state.copyWith(isLoading: true);
    final snapshots =
        await FirebaseApi.getReleaseGames(pageSize, platform: platform);

    if (snapshots.size == 0) {
      return;
    }

    if (snapshots.size < pageSize) {
      state = state.copyWith(hasMore: false);
    } else {
      state = state.copyWith(hasMore: true);
    }
    fetchedLastDoc = snapshots.docs.last;
    var list = [...snapshots.docs.map((qds) => qds.data()).toList()];
    state = state.copyWith(releaseGames: list, isLoading: false);
  }

  /// 次のドキュメントを読み込む
  Future<void> fetchPosts(String? platform) async {
    state = state.copyWith(isLoading: true);
    final snapshots = await FirebaseApi.getReleaseGames(pageSize,
        startAfter: fetchedLastDoc, platform: platform);

    if (snapshots.size == 0) {
      return;
    }

    if (snapshots.size < pageSize) {
      state = state.copyWith(hasMore: false);
    } else {
      state = state.copyWith(hasMore: true);
    }
    fetchedLastDoc = snapshots.docs.last;
    var list = [
      ...state.releaseGames,
      ...snapshots.docs.map((qds) => qds.data()).toList()
    ];
    state = state.copyWith(releaseGames: list, isLoading: false);
  }
}
