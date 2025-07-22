import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  void initState() {
    super.initState();
    context.read<StatisticsBloc>().add(const StatisticsEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statistics),
      ),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            loaded: (analytics) {
              final completed = analytics.$1;
              final pending = analytics.$2;
              final total = completed + pending;

              if (total == 0) {
                return Center(
                  child: Text(l10n.emptyTasks),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: SfCartesianChart(
                        primaryXAxis: const CategoryAxis(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: [
                          ColumnSeries<TaskData, String>(
                            dataSource: [
                              TaskData(
                                label: l10n.pending,
                                value: pending,
                                color: Colors.orange,
                              ),
                              TaskData(
                                label: l10n.completed,
                                value: completed,
                                color: Colors.green,
                              ),
                            ],
                            xValueMapper: (datum, _) => datum.label,
                            yValueMapper: (datum, _) => datum.value,
                            pointColorMapper: (datum, _) => datum.color,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.taskSummary(
                        completed,
                        pending,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            failed: (error) => Center(child: Text('Error: $error')),
          );
        },
      ),
    );
  }
}

class TaskData {
  TaskData({
    required this.label,
    required this.value,
    required this.color,
  });
  final String label;
  final int value;
  final Color color;
}
