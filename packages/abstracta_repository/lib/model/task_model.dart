import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    required String description,
    required List<String> tags,
    required TaskStatus status,
    required String assignedTo,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

enum TaskStatus {
  pending,
  completed,
  inProgress,
}
