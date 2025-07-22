import 'package:abstracta_ivo/features/statistics/bloc/bloc.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAbstractaRepository extends Mock implements IAbstractaRepository {}

void main() {
  late StatisticsBloc statisticsBloc;
  late MockAbstractaRepository mockRepository;

  setUp(() {
    mockRepository = MockAbstractaRepository();
    statisticsBloc = StatisticsBloc(abstractaRepository: mockRepository);
  });

  tearDown(() {
    statisticsBloc.close();
  });

  group('StatisticsBloc', () {
    test('emits [loading, failed] when repository returns Left (error)', () {
      // Arrange: el repositorio devuelve Left (error)
      when(() => mockRepository.getStatistics())
          .thenAnswer((_) async => Left('error'));

      // Assert later los estados
      final expectedStates = [
        const StatisticsState.loading(),
        const StatisticsState.failed(error: 'Failed to fetch statistics'),
      ];

      expectLater(statisticsBloc.stream, emitsInOrder(expectedStates));

      // Act
      statisticsBloc.add(const GetStatistics());
    });

    test(
        'emits [loading, loaded] when repository returns Right with statistics tuple',
        () {
      const stats = (10, 5);

      // Arrange: repositorio devuelve Right con estadísticas
      when(() => mockRepository.getStatistics())
          .thenAnswer((_) async => const Right(stats));

      final expectedStates = [
        const StatisticsState.loading(),
        const StatisticsState.loaded(statistics: stats),
      ];

      expectLater(statisticsBloc.stream, emitsInOrder(expectedStates));

      // Act
      statisticsBloc.add(const GetStatistics());
    });
  });
}
