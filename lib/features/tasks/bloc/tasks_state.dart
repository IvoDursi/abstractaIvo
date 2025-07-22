import 'package:abstracta_repository/model/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksInitial;

  const factory TasksState.loading() = TasksLoading;

  const factory TasksState.loaded({
    required List<TaskModel> tasks,
  }) = TasksLoaded;

  const factory TasksState.failed({
    required String error,
  }) = TasksFailed;
}
