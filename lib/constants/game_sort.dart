import 'package:flutter/material.dart';
import 'package:game_sale/generated/l10n.dart';

enum GameSort { releaseDateDesc, releaseDateAsc, salePriceDesc, salePriceAsc }

extension GameSortExtension on GameSort {
  int get key {
    switch (this) {
      case GameSort.releaseDateDesc:
        return 0;
      case GameSort.releaseDateAsc:
        return 1;
      case GameSort.salePriceDesc:
        return 2;
      case GameSort.salePriceAsc:
        return 3;
    }
  }

  String get value {
    switch (this) {
      case GameSort.releaseDateDesc:
        return S.current.releaseDateSort;
      case GameSort.releaseDateAsc:
        return S.current.releaseDateSort;
      case GameSort.salePriceDesc:
        return S.current.salePriceSort;
      case GameSort.salePriceAsc:
        return S.current.salePriceSort;
    }
  }

  Icon get icon {
    switch (this) {
      case GameSort.releaseDateDesc:
        return const Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        );
      case GameSort.releaseDateAsc:
        return const Icon(
          Icons.arrow_upward,
          color: Colors.grey,
        );
      case GameSort.salePriceDesc:
        return const Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        );
      case GameSort.salePriceAsc:
        return const Icon(
          Icons.arrow_upward,
          color: Colors.grey,
        );
    }
  }
}
