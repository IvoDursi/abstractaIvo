import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = Initial;

  const factory StatisticsState.loading() = Loading;

  const factory StatisticsState.loaded({
    required (int completed, int pending) statistics,
  }) = Loaded;

  const factory StatisticsState.failed({
    required String error,
  }) = Failed;
}
