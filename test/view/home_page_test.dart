import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockTasksBloc extends Mock implements TasksBloc {}

class MockTaskActionBloc extends Mock implements TaskActionBloc {}

class MockStatisticsBloc extends Mock implements StatisticsBloc {}

class FakeTasksEvent extends Fake implements TasksEvent {}

class FakeTaskActionEvent extends Fake implements TaskActionEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(FakeTasksEvent());
    registerFallbackValue(FakeTaskActionEvent());
  });

  late TasksBloc tasksBloc;
  late TaskActionBloc taskActionBloc;
  late StatisticsBloc statisticsBloc;
  setUp(() {
    tasksBloc = MockTasksBloc();
    taskActionBloc = MockTaskActionBloc();
    statisticsBloc = MockStatisticsBloc();

    when(() => tasksBloc.stream)
        .thenAnswer((_) => const Stream<TasksState>.empty());
    when(() => tasksBloc.state).thenReturn(const TasksState.initial());
    when(() => tasksBloc.add(any())).thenReturn(null);

    when(() => taskActionBloc.stream)
        .thenAnswer((_) => const Stream<TaskActionState>.empty());
    when(() => taskActionBloc.state)
        .thenReturn(const TaskActionState.initial());
    when(() => taskActionBloc.add(any())).thenReturn(null);

    when(() => statisticsBloc.stream)
        .thenAnswer((_) => const Stream<StatisticsState>.empty());
    when(() => statisticsBloc.state)
        .thenReturn(const StatisticsState.initial());
  });

  testWidgets('HomePage muestra TasksPage al iniciar', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>.value(value: tasksBloc),
          BlocProvider<TaskActionBloc>.value(value: taskActionBloc),
        ],
        child: const MaterialApp(
          home: HomePage(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );

    expect(find.byType(TasksPage), findsOneWidget);
    expect(find.byType(StatisticsPage), findsNothing);
  });

  testWidgets('HomePage navega a StatisticsPage al presionar la tab',
      (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>.value(value: tasksBloc),
          BlocProvider<TaskActionBloc>.value(value: taskActionBloc),
          BlocProvider<StatisticsBloc>.value(value: statisticsBloc),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomePage(),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.bar_chart));
    await tester.pump();

    expect(find.byType(StatisticsPage), findsOneWidget);
    expect(find.byType(TasksPage), findsNothing);
  });
}
