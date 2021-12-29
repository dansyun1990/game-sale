import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters.freezed.dart';

@freezed
class Filters with _$Filters {
  const factory Filters({
    @Default(<String>[]) List<String> filters,
  }) = _Filters;
}
