import 'package:abstracta_repository/model/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_action_state.freezed.dart';

@freezed
class TaskActionState with _$TaskActionState {
  const factory TaskActionState.initial() = TaskActionInitialState;

  const factory TaskActionState.loading() = ActionLoading;

  const factory TaskActionState.actionSucceeded({
    required List<TaskModel> tasks,
  }) = ActionSucceded;

  const factory TaskActionState.failed({
    required String error,
  }) = ActionFailed;
}
