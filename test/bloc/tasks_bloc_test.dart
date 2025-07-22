import 'dart:async';

import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

// Mock y fallback
class MockAbstractaRepository extends Mock implements IAbstractaRepository {}

void main() {
  late MockAbstractaRepository mockRepository;
  late TasksBloc bloc;
  late StreamController<List<TaskModel>> tasksStreamController;

  final task = TaskModel(
    id: '1',
    title: 'Test',
    description: 'desc',
    assignedTo: 'user',
    tags: [],
    status: TaskStatus.pending,
    createdAt: DateTime(2024),
  );

  setUpAll(() {
    registerFallbackValue(TaskStatus.pending);
  });

  setUp(() {
    mockRepository = MockAbstractaRepository();
    tasksStreamController = StreamController<List<TaskModel>>.broadcast();

    when(() => mockRepository.onTasksChanged)
        .thenAnswer((_) => tasksStreamController.stream);

    bloc = TasksBloc(abstractaRepository: mockRepository);
  });

  tearDown(() async {
    await tasksStreamController.close();
    await bloc.close();
  });

  group('TasksBloc', () {
    blocTest<TasksBloc, TasksState>(
      'emits [loading, loaded] when GetTasks succeeds',
      build: () {
        when(() => mockRepository.getTasks(status: any(named: 'status')))
            .thenAnswer((_) async => Right([task]));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetTasks(status: TaskStatus.pending)),
      expect: () => [
        const TasksState.loading(),
        TasksState.loaded(tasks: [task]),
      ],
    );

    blocTest<TasksBloc, TasksState>(
      'emits [loading, failed] when GetTasks fails',
      build: () {
        when(() => mockRepository.getTasks(status: any(named: 'status')))
            .thenAnswer((_) async => const Left('error'));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetTasks(status: TaskStatus.pending)),
      expect: () => [
        const TasksState.loading(),
        const TasksState.failed(error: 'Failed to fetch tasks'),
      ],
    );

    blocTest<TasksBloc, TasksState>(
      'emits [loading, loaded] when RefreshTasks is triggered manually',
      build: () => bloc,
      act: (bloc) => bloc.add(RefreshTasks(tasks: [task])),
      expect: () => [
        const TasksState.loading(),
        TasksState.loaded(tasks: [task]),
      ],
    );
    test('emits loaded state from stream via onTasksChanged', () async {
      tasksStreamController.add([task]);

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const TasksState.loading(),
          TasksState.loaded(tasks: [task]),
        ]),
      );
    });
  });
}
