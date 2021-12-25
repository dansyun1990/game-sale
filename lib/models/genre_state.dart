import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_state.freezed.dart';

@freezed
class GenreState with _$GenreState {
  const factory GenreState({
    @Default(<String>[]) List<String> genreList,
  }) = _GenreState;
}
