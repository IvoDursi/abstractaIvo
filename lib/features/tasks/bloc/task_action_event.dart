import 'package:abstracta_repository/model/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_action_event.freezed.dart';

@freezed
class TaskActionEvent with _$TaskActionEvent {
  const factory TaskActionEvent.removeTask({
    required String taskId,
  }) = RemoveTask;

  const factory TaskActionEvent.addTask({
    required String? title,
    required String? description,
    required String? prompt,
    required String assignedTo,
  }) = AddTask;

  const factory TaskActionEvent.editTask({
    required String title,
    required String description,
    required String assignedTo,
    required TaskStatus status,
    required String taskId,
  }) = EditTask;
}
