import 'package:abstracta_ivo/features/tasks/tasks.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskActionBloc extends Bloc<TaskActionEvent, TaskActionState> {
  TaskActionBloc({required this.abstractaRepository})
      : super(const TaskActionState.initial()) {
    on<AddTask>(_onAddTask);
    on<RemoveTask>(_onRemoveTask);
    on<EditTask>(_onEditTask);
  }

  final IAbstractaRepository abstractaRepository;

  Future<void> _onAddTask(AddTask event, Emitter<TaskActionState> emit) async {
    emit(const TaskActionState.loading());
    final current = state.maybeWhen(
      actionSucceeded: (tasks) => tasks,
      orElse: () => <TaskModel>[],
    );

    final result = await abstractaRepository.addTask(
      title: event.title,
      description: event.description,
      assignation: event.assignedTo,
      prompt: event.prompt,
    );
    result.fold(
      (_) => emit(const TaskActionState.failed(error: 'Failed to add task')),
      (task) {
        final updated = List<TaskModel>.from(current)..add(task);
        emit(TaskActionState.actionSucceeded(tasks: updated));
      },
    );
  }

  Future<void> _onRemoveTask(
      RemoveTask event, Emitter<TaskActionState> emit) async {
    emit(const TaskActionState.loading());

    final current = state.maybeWhen(
      actionSucceeded: (tasks) => tasks,
      orElse: () => <TaskModel>[],
    );

    final result = await abstractaRepository.removeTask(event.taskId);
    result.fold(
      (_) => emit(const TaskActionState.failed(error: 'Failed to remove task')),
      (_) {
        final updated = current.where((t) => t.id != event.taskId).toList();
        emit(TaskActionState.actionSucceeded(tasks: updated));
      },
    );
  }

  Future<void> _onEditTask(
      EditTask event, Emitter<TaskActionState> emit) async {
    emit(const TaskActionState.loading());
    final result = await abstractaRepository.editTask(
      taskId: event.taskId,
      title: event.title,
      description: event.description,
      status: event.status,
      assignedTo: event.assignedTo,
    );
    result.fold(
      (_) => emit(const TaskActionState.failed(error: 'Failed to remove task')),
      (tasks) {
        emit(TaskActionState.actionSucceeded(tasks: tasks));
      },
    );
  }
}
