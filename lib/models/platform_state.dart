import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_state.freezed.dart';

@freezed
class PlatformState with _$PlatformState {
  const factory PlatformState({
    @Default(<int>[]) List<int> platformList,
  }) = _PlatformState;
}
