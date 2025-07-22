import 'package:abstracta_repository/model/task_model.dart';
import 'package:dartz/dartz.dart';

abstract class IAbstractaRepository {
  const IAbstractaRepository();

  Future<Either<void, List<TaskModel>>> getTasks({
    TaskStatus? status,
  });

  Future<Either<void, TaskModel>> addTask({
    required String assignation,
    required String? description,
    required String? title,
    required String? prompt,
  });

  Future<Either<void, void>> removeTask(String taskId);

  Future<Either<void, List<TaskModel>>> editTask({
    required String taskId,
    required String title,
    required String description,
    required String assignedTo,
    required TaskStatus status,
  });

  Future<Either<void, (int completed, int pending)>> getStatistics();

  Stream<List<TaskModel>> get onTasksChanged;
}
