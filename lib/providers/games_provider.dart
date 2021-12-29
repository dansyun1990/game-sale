import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_sale/api/firebase_api.dart';
import 'package:game_sale/constants/game_sort.dart';
import 'package:game_sale/models/game.dart';
import 'package:game_sale/models/games.dart';
import 'package:game_sale/providers/sort_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'filter_provider.dart';

/// ゲームセール一覧保持のProvider
final gamesProvider = StateNotifierProvider<GamesStateNotifier, Games>(
  (ref) => GamesStateNotifier(
      sort: ref.watch(sortSelectorProvider),
      platforms: ref.read(platformSelectorProvider).filters,
      genres: ref.read(genreSelectorProvider).filters),
);

/// ゲームセール一覧保持・検索を行うStateNotifier
class GamesStateNotifier extends StateNotifier<Games> {
  GamesStateNotifier(
      {required GameSort sort,
      required List<String> platforms,
      required List<String> genres})
      : super(const Games(games: [])) {
    fetchFirstPosts(sort: sort, platforms: platforms, genres: genres);
  }

  /// 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  /// 1ページごとに読み込む数
  static const pageSize = 5;

  ///　最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstPosts(
      {required GameSort sort,
      required List<String> platforms,
      required List<String> genres}) async {
    state = state.copyWith(isLoading: true);

    final QuerySnapshot<Game> snapshots;
    final List<Game> list;

    if (platforms.isNotEmpty && genres.isNotEmpty) {
      snapshots = await FirebaseApi.getGames(
        pageSize,
        sort: sort,
        platforms: platforms,
        genres: [],
      );

      list = [
        ...snapshots.docs
            .map((qds) => qds.data())
            .where((element) =>
                element.genre.toSet().intersection(genres.toSet()).isNotEmpty)
            .toList()
      ];
    } else {
      snapshots = await FirebaseApi.getGames(
        pageSize,
        sort: sort,
        platforms: platforms,
        genres: genres,
      );

      list = [...snapshots.docs.map((doc) => doc.data()).toList()];
    }

    if (snapshots.size == 0) {
      return;
    }

    if (snapshots.size < pageSize) {
      state = state.copyWith(hasMore: false);
    } else {
      state = state.copyWith(hasMore: true);
    }
    fetchedLastDoc = snapshots.docs.last;
    state = state.copyWith(games: list, isLoading: false);
  }

  /// 次のドキュメントを読み込む
  Future<void> fetchPosts(
      {required GameSort sort,
      required List<String> platforms,
      required List<String> genres}) async {
    state = state.copyWith(isLoading: true);
    final QuerySnapshot<Game> snapshots;
    final List<Game> list;

    if (platforms.isNotEmpty && genres.isNotEmpty) {
      snapshots = await FirebaseApi.getGames(
        pageSize,
        sort: sort,
        platforms: platforms,
        genres: [],
        startAfter: fetchedLastDoc,
      );

      list = [
        ...state.games,
        ...snapshots.docs
            .map((qds) => qds.data())
            .where((element) =>
                element.genre.toSet().intersection(genres.toSet()).isNotEmpty)
            .toList()
      ];
    } else {
      snapshots = await FirebaseApi.getGames(
        pageSize,
        sort: sort,
        platforms: platforms,
        genres: genres,
        startAfter: fetchedLastDoc,
      );

      list = [
        ...state.games,
        ...snapshots.docs.map((doc) => doc.data()).toList()
      ];
    }

    if (snapshots.size == 0) {
      return;
    }

    if (snapshots.size < pageSize) {
      state = state.copyWith(hasMore: false);
    } else {
      state = state.copyWith(hasMore: true);
    }
    fetchedLastDoc = snapshots.docs.last;
    state = state.copyWith(games: list, isLoading: false);
  }
}
