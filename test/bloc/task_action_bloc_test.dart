import 'package:abstracta_ivo/features/features.dart';

import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockAbstractaRepository extends Mock implements IAbstractaRepository {}

void main() {
  late MockAbstractaRepository mockRepository;
  late TaskActionBloc bloc;

  final fakeTask = TaskModel(
    id: '1',
    title: 'Task 1',
    description: 'Description',
    assignedTo: 'user_123',
    status: TaskStatus.pending,
    tags: [],
    createdAt: DateTime(
      2024,
    ),
  );

  setUp(() {
    mockRepository = MockAbstractaRepository();
    bloc = TaskActionBloc(abstractaRepository: mockRepository);
  });
  setUpAll(() {
    registerFallbackValue(TaskStatus.pending);
  });

  group('TaskActionBloc', () {
    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, success] when AddTask succeeds',
      build: () {
        when(
          () => mockRepository.addTask(
            title: any(named: 'title'),
            description: any(named: 'description'),
            assignation: any(named: 'assignation'),
            prompt: any(named: 'prompt'),
          ),
        ).thenAnswer((_) async => Right(fakeTask));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AddTask(
          title: 'Task 1',
          description: 'Description',
          assignedTo: 'user_123',
          prompt: 'Prompt',
        ),
      ),
      expect: () => [
        const TaskActionState.loading(),
        TaskActionState.actionSucceeded(tasks: [fakeTask]),
      ],
    );

    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, failed] when AddTask fails',
      build: () {
        when(
          () => mockRepository.addTask(
            title: any(named: 'title'),
            description: any(named: 'description'),
            assignation: any(named: 'assignation'),
            prompt: any(named: 'prompt'),
          ),
        ).thenAnswer((_) async => const Left('error'));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const AddTask(
          title: 'Task 1',
          description: 'Description',
          assignedTo: 'user_123',
          prompt: 'Prompt',
        ),
      ),
      expect: () => [
        const TaskActionState.loading(),
        const TaskActionState.failed(error: 'Failed to add task'),
      ],
    );

    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, success] when RemoveTask succeeds',
      build: () {
        when(() => mockRepository.removeTask('1'))
            .thenAnswer((_) async => const Right(unit));
        bloc.emit(TaskActionState.actionSucceeded(tasks: [fakeTask]));
        return bloc;
      },
      act: (bloc) => bloc.add(const RemoveTask(taskId: '1')),
      expect: () => [
        const TaskActionState.loading(),
        const TaskActionState.actionSucceeded(tasks: []),
      ],
    );

    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, failed] when RemoveTask fails',
      build: () {
        when(() => mockRepository.removeTask('1'))
            .thenAnswer((_) async => const Left('error'));
        return bloc;
      },
      act: (bloc) => bloc.add(const RemoveTask(taskId: '1')),
      expect: () => [
        const TaskActionState.loading(),
        const TaskActionState.failed(error: 'Failed to remove task'),
      ],
    );

    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, success] when EditTask succeeds',
      build: () {
        when(
          () => mockRepository.editTask(
            taskId: '1',
            title: any(named: 'title'),
            description: any(named: 'description'),
            status: any(named: 'status'),
            assignedTo: any(named: 'assignedTo'),
          ),
        ).thenAnswer((_) async => Right([fakeTask]));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const EditTask(
          taskId: '1',
          title: 'Updated',
          description: 'Updated',
          status: TaskStatus.completed,
          assignedTo: 'user_123',
        ),
      ),
      expect: () => [
        const TaskActionState.loading(),
        TaskActionState.actionSucceeded(tasks: [fakeTask]),
      ],
    );

    blocTest<TaskActionBloc, TaskActionState>(
      'emits [loading, failed] when EditTask fails',
      build: () {
        when(
          () => mockRepository.editTask(
            taskId: any(named: 'taskId'),
            title: any(named: 'title'),
            description: any(named: 'description'),
            status: any(named: 'status'),
            assignedTo: any(named: 'assignedTo'),
          ),
        ).thenAnswer((_) async => const Left('error'));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const EditTask(
          taskId: '1',
          title: 'Updated',
          description: 'Updated',
          status: TaskStatus.completed,
          assignedTo: 'user_123',
        ),
      ),
      expect: () => [
        const TaskActionState.loading(),
        const TaskActionState.failed(error: 'Failed to remove task'),
      ],
    );
  });
}
