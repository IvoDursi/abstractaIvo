import 'dart:io';

import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/arb/app_localizations.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockTasksBloc extends Mock implements TasksBloc {}

class FakeTasksEvent extends Fake implements TasksEvent {}

class FakeTasksState extends Fake implements TasksState {}

void main() {
  late TasksBloc mockTasksBloc;

  setUpAll(() {
    registerFallbackValue(FakeTasksEvent());
    registerFallbackValue(FakeTasksState());
  });

  setUp(() {
    mockTasksBloc = MockTasksBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>.value(
            value: mockTasksBloc,
          ),
        ],
        child: child,
      ),
    );
  }

  testWidgets('shows AppBar title with localized tasks', (tester) async {
    when(() => mockTasksBloc.state).thenReturn(const TasksState.initial());
    whenListen(mockTasksBloc, Stream.value(const TasksState.initial()));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pump();

    final context = tester.element(find.byType(TasksPage));
    final expectedText = context.l10n.tasks;

    expect(find.text(expectedText), findsOneWidget);
  });

  testWidgets('shows CircularProgressIndicator on loading state',
      (tester) async {
    when(() => mockTasksBloc.state).thenReturn(const TasksState.loading());
    whenListen(mockTasksBloc, Stream.value(const TasksState.loading()));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('debug prints all Text widgets', (tester) async {
    when(() => mockTasksBloc.state).thenReturn(const TasksState.initial());
    whenListen(mockTasksBloc, Stream.value(const TasksState.initial()));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pump(const Duration(milliseconds: 100));

    final texts = find
        .byType(Text)
        .evaluate()
        .map((e) => (e.widget as Text).data)
        .toList();
    print('Texts in widget tree: $texts');

    expect(texts, isNotEmpty);
  });
  testWidgets('shows empty message when no tasks', (tester) async {
    when(() => mockTasksBloc.state)
        .thenReturn(const TasksState.loaded(tasks: []));
    whenListen(mockTasksBloc, Stream.value(const TasksState.loaded(tasks: [])));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(TasksPage));
    final expectedText = context.l10n.emptyTasks;

    expect(find.text(expectedText), findsOneWidget);
  });
  testWidgets('shows list with tasks when loaded', (tester) async {
    final tasks = [
      TaskModel(
        id: '1',
        title: 'Task 1',
        status: TaskStatus.pending,
        description: '',
        tags: [],
        assignedTo: '',
        createdAt: DateTime(0),
      ),
      TaskModel(
        id: '2',
        title: 'Task 2',
        status: TaskStatus.completed,
        description: '',
        tags: [],
        assignedTo: '',
        createdAt: DateTime(0),
      ),
    ];

    when(() => mockTasksBloc.state).thenReturn(TasksState.loaded(tasks: tasks));
    whenListen(mockTasksBloc, Stream.value(TasksState.loaded(tasks: tasks)));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(CustomCard), findsNWidgets(tasks.length));
  });

  testWidgets('emits event when selecting filter from PopupMenuButton',
      (tester) async {
    when(() => mockTasksBloc.state).thenReturn(const TasksState.initial());
    whenListen(mockTasksBloc, Stream.value(const TasksState.initial()));

    await tester.pumpWidget(makeTestableWidget(const TasksPage()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final pendientesFinder = find.text('Pendientes');
    expect(pendientesFinder, findsOneWidget);

    await tester.tap(pendientesFinder);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    verify(
      () => mockTasksBloc.add(
        const TasksEvent.get(status: TaskStatus.pending),
      ),
    ).called(1);
  });
}
