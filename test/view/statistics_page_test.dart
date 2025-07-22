import 'package:abstracta_ivo/features/statistics/bloc/bloc.dart';
import 'package:abstracta_ivo/features/statistics/view/statistics_page.dart';
import 'package:abstracta_ivo/l10n/arb/app_localizations.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MockStatisticsBloc extends Mock implements StatisticsBloc {}

class FakeStatisticsEvent extends Fake implements StatisticsEvent {}

class FakeStatisticsState extends Fake implements StatisticsState {}

void main() {
  late StatisticsBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(FakeStatisticsEvent());
    registerFallbackValue(FakeStatisticsState());
  });

  setUp(() {
    mockBloc = MockStatisticsBloc();
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<StatisticsBloc>.value(
        value: mockBloc,
        child: child,
      ),
    );
  }

  testWidgets('dispatches GetStatistics on initState', (tester) async {
    when(() => mockBloc.state).thenReturn(const StatisticsState.initial());
    whenListen(mockBloc, const Stream<StatisticsState>.empty());

    await tester.pumpWidget(makeTestableWidget(const StatisticsPage()));

    verify(() => mockBloc.add(const GetStatistics())).called(1);
  });

  testWidgets('shows CircularProgressIndicator on loading state',
      (tester) async {
    when(() => mockBloc.state).thenReturn(const StatisticsState.loading());
    whenListen(mockBloc, Stream.value(const StatisticsState.loading()));

    await tester.pumpWidget(makeTestableWidget(const StatisticsPage()));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
  testWidgets('shows empty message when total tasks is 0', (tester) async {
    const stats = (0, 0);
    when(() => mockBloc.state)
        .thenReturn(const StatisticsState.loaded(statistics: stats));
    whenListen(
      mockBloc,
      Stream.value(const StatisticsState.loaded(statistics: stats)),
    );

    await tester.pumpWidget(makeTestableWidget(const StatisticsPage()));
    await tester.pump();

    // Buscamos el texto exacto del l10n.emptyTasks
    final BuildContext context = tester.element(find.byType(StatisticsPage));
    final l10n = context.l10n;

    expect(find.text(l10n.emptyTasks), findsOneWidget);
  });

  testWidgets('shows chart and tasks count when loaded with data',
      (tester) async {
    const stats = (3, 5);
    when(() => mockBloc.state)
        .thenReturn(const StatisticsState.loaded(statistics: stats));
    whenListen(
      mockBloc,
      Stream.value(const StatisticsState.loaded(statistics: stats)),
    );

    await tester.pumpWidget(makeTestableWidget(const StatisticsPage()));
    await tester.pump(const Duration(seconds: 1));

    // Verifico que aparece SfCartesianChart
    expect(find.byType(SfCartesianChart), findsOneWidget);

    // Verifico texto con conteo
    expect(
      find.text('Tienes 5 tareas pendientes y 3 tareas completadas.'),
      findsOneWidget,
    );
  });

  testWidgets('shows error message when failed state', (tester) async {
    const errorMsg = 'Some error';
    when(() => mockBloc.state)
        .thenReturn(const StatisticsState.failed(error: errorMsg));
    whenListen(
      mockBloc,
      Stream.value(const StatisticsState.failed(error: errorMsg)),
    );

    await tester.pumpWidget(makeTestableWidget(const StatisticsPage()));
    await tester.pump();

    expect(find.text('Error: $errorMsg'), findsOneWidget);
  });
}
