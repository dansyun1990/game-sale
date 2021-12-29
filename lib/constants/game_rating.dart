import 'package:flutter/material.dart';

enum GameRating { a, b, c, d, z }

extension GameRatingExtension on GameRating {
  String get key {
    switch (this) {
      case GameRating.a:
        return 'A';
      case GameRating.b:
        return 'B';
      case GameRating.c:
        return 'C';
      case GameRating.d:
        return 'D';
      case GameRating.z:
        return 'Z';
    }
  }

  Image get image {
    switch (this) {
      case GameRating.a:
        return Image.asset(
          'assets/images/A.png',
          width: 40,
          height: 40,
        );
      case GameRating.b:
        return Image.asset(
          'assets/images/B.png',
          width: 40,
          height: 40,
        );
      case GameRating.c:
        return Image.asset(
          'assets/images/C.png',
          width: 40,
          height: 40,
        );
      case GameRating.d:
        return Image.asset(
          'assets/images/D.png',
          width: 40,
          height: 40,
        );
      case GameRating.z:
        return Image.asset(
          'assets/images/Z.png',
          width: 40,
          height: 40,
        );
    }
  }
}
