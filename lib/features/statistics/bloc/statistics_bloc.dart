import 'package:abstracta_ivo/features/statistics/bloc/bloc.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc({
    required this.abstractaRepository,
  }) : super(const StatisticsState.initial()) {
    on<GetStatistics>(_onGetStatistics);
  }

  final IAbstractaRepository abstractaRepository;

  Future<void> _onGetStatistics(
    GetStatistics event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(const StatisticsState.loading());
    final statisticsEither = await abstractaRepository.getStatistics();

    if (statisticsEither.isLeft()) {
      emit(const StatisticsState.failed(error: 'Failed to fetch statistics'));
      return;
    }

    final statistics =
        (statisticsEither as Right<void, (int completed, int pending)>).value;

    emit(
      StatisticsState.loaded(
        statistics: statistics,
      ),
    );
  }
}
