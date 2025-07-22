import 'package:abstracta_repository/model/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_event.freezed.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.get({
    TaskStatus? status,
  }) = GetTasks;

  const factory TasksEvent.refresh({
    List<TaskModel>? tasks,
  }) = RefreshTasks;
}
