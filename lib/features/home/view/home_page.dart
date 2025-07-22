import 'dart:io';

import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TasksBloc>().add(const TasksEvent.get());
  }

  int _currentIndex = 0;

  final List<Widget> _screens = const [
    TasksPage(),
    StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                final modal = BlocProvider.value(
                  value: context.read<TaskActionBloc>(),
                  child: const AddOrEditTaskModal(),
                );

                if (Platform.isIOS) {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (_) => Material(
                      child: modal,
                    ),
                  );
                } else {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => modal,
                  );
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: l10n.tasks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart),
            label: l10n.statistics,
          ),
        ],
      ),
    );
  }
}
