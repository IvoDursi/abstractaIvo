import 'dart:async';

import 'package:abstracta_ivo/features/tasks/tasks.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required this.abstractaRepository})
      : super(const TasksState.initial()) {
    on<GetTasks>(_onGetTasks);
    on<RefreshTasks>(_onRefreshTasks);
    abstractaRepository.onTasksChanged.listen((tasks) {
      add(RefreshTasks(tasks: tasks));
    });
  }

  final IAbstractaRepository abstractaRepository;

  Future<void> _onGetTasks(GetTasks event, Emitter<TasksState> emit) async {
    emit(const TasksState.loading());
    final tasksEither = await abstractaRepository.getTasks(
      status: event.status,
    );
    tasksEither.fold(
      (_) => emit(const TasksState.failed(error: 'Failed to fetch tasks')),
      (tasks) => emit(TasksState.loaded(tasks: tasks)),
    );
  }

  Future<void> _onRefreshTasks(
    RefreshTasks event,
    Emitter<TasksState> emit,
  ) async {
    emit(const TasksState.loading());

    emit(TasksState.loaded(tasks: event.tasks ?? []));
  }
}
