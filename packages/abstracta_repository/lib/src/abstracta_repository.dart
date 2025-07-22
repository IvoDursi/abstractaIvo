import 'dart:async';

import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:dartz/dartz.dart';
import 'package:local_storage_service/local_storage_service.dart';
import 'package:local_storage_service/resources/keys.dart';
import 'package:gemini_service/i_gemini_service.dart';

/// {@template abstracta_repository}
/// Abstracta Repository
/// {@endtemplate}
class AbstractaRepository extends IAbstractaRepository {
  AbstractaRepository({
    required this.geminiService,
    required this.localStorageService,
  });

  final IGeminiService geminiService;
  final LocalStorageService localStorageService;

  final _tasksController = StreamController<List<TaskModel>>.broadcast();

  Stream<List<TaskModel>> get onTasksChanged => _tasksController.stream;

  @override
  Future<Either<void, List<TaskModel>>> getTasks({
    TaskStatus? status,
  }) async {
    final tasksEither = localStorageService.get(
      key: StorageKeys.tasksKey,
      fromJson: (Map<String, dynamic> json) {
        final tasksJson = json['tasks'] as List<dynamic>;

        final searches = tasksJson
            .map((e) => e)
            .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return searches;
      },
    );

    return tasksEither.fold(
      (failure) => const Right([]),
      (tasks) {
        final filteredTasks = status == null
            ? tasks ?? []
            : (tasks ?? []).where((t) => t.status == status).toList();

        return Right(filteredTasks);
      },
    );
  }

  @override
  Future<Either<void, TaskModel>> addTask({
    required String assignation,
    required String? description,
    required String? title,
    required String? prompt,
  }) async {
    final currentTasksEither = await getTasks();

    late TaskModel task;

    if (prompt != null && prompt.isNotEmpty) {
      final promptResponseEither =
          await geminiService.sendPromptToGemini(prompt);

      if (promptResponseEither.isLeft()) {
        return const Left(null);
      }

      final promptResponse =
          (promptResponseEither as Right<String, Map<String, dynamic>?>).value;

      if (promptResponse == null) {
        return const Left(null);
      }

      task = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: promptResponse['title'].toString(),
        description: promptResponse['description'].toString(),
        tags: const [],
        status: TaskStatus.pending,
        assignedTo: assignation,
        createdAt: DateTime.now(),
      );
    } else if (title != null && description != null) {
      task = TaskModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        tags: const [],
        status: TaskStatus.pending,
        assignedTo: assignation,
        createdAt: DateTime.now(),
      );
    }

    return currentTasksEither.fold(
      (failure) => const Left(null),
      (currentTasks) async {
        final updatedTasks = [...currentTasks, task];

        final saveResultEither = await localStorageService.save(
          key: StorageKeys.tasksKey,
          value: {
            'tasks': updatedTasks.map((t) => t.toJson()).toList(),
          },
        );

        return saveResultEither.fold(
          (failure) => const Left(null),
          (_) {
            _tasksController.add(updatedTasks);

            return Right(task);
          },
        );
      },
    );
  }

  @override
  Future<Either<void, void>> removeTask(String taskId) async {
    final currentTasksEither = await getTasks();

    return currentTasksEither.fold(
      (failure) => const Left(null),
      (currentTasks) async {
        final updatedTasks =
            currentTasks.where((task) => task.id != taskId).toList();

        final saveResult = await localStorageService.save(
          key: StorageKeys.tasksKey,
          value: {
            'tasks': updatedTasks.map((t) => t.toJson()).toList(),
          },
        );

        return saveResult.fold(
          (failure) => const Left(null),
          (_) {
            _tasksController.add(updatedTasks);

            return const Right(null);
          },
        );
      },
    );
  }

  @override
  Future<Either<void, List<TaskModel>>> editTask({
    required String taskId,
    required String title,
    required String description,
    required String assignedTo,
    required TaskStatus status,
  }) async {
    final currentTasksEither = await getTasks();

    return currentTasksEither.fold(
      (failure) => const Left(null),
      (currentTasks) async {
        final updatedTasks = currentTasks.map((task) {
          if (task.id == taskId) {
            return task.copyWith(
              title: title,
              description: description,
              status: status,
              assignedTo: assignedTo,
            );
          }
          return task;
        }).toList();

        final saveResult = await localStorageService.save(
          key: StorageKeys.tasksKey,
          value: {
            'tasks': updatedTasks.map((t) => t.toJson()).toList(),
          },
        );

        return saveResult.fold(
          (failure) => const Left(null),
          (_) {
            _tasksController.add(updatedTasks);

            return Right(updatedTasks);
          },
        );
      },
    );
  }

  @override
  Future<Either<void, (int completed, int pending)>> getStatistics() async {
    final currentTasksEither = await getTasks();

    return currentTasksEither.fold(
      (failure) => const Left(null),
      (tasks) {
        final completedCount =
            tasks.where((task) => task.status == TaskStatus.completed).length;
        final pendingCount =
            tasks.where((task) => task.status == TaskStatus.pending).length;

        return Right((completedCount, pendingCount));
      },
    );
  }
}
