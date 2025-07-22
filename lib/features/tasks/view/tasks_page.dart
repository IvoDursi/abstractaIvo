import 'dart:io';

import 'package:abstracta_ivo/features/tasks/tasks.dart';
import 'package:abstracta_ivo/l10n/l10n.dart';
import 'package:abstracta_repository/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tasks),
        actions: [
          PopupMenuButton<TaskStatus?>(
            icon: const Icon(Icons.filter_list),
            onSelected: (status) {
              context.read<TasksBloc>().add(
                    TasksEvent.get(status: status),
                  );
            },
            itemBuilder: (context) => [
              PopupMenuItem<TaskStatus?>(
                child: Text(l10n.all),
                onTap: () {
                  context.read<TasksBloc>().add(
                        const TasksEvent.get(),
                      );
                },
              ),
              PopupMenuItem<TaskStatus>(
                value: TaskStatus.pending,
                child: Text(l10n.pendingPlural),
              ),
              PopupMenuItem<TaskStatus?>(
                value: TaskStatus.inProgress,
                child: Text(l10n.inProgress),
              ),
              PopupMenuItem<TaskStatus>(
                value: TaskStatus.completed,
                child: Text(l10n.completedPlural),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (tasks) => tasks.isNotEmpty
                ? ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) => CustomCard(
                      task: tasks[index],
                      onTap: () {
                        final modal = BlocProvider.value(
                          value: context.read<TaskActionBloc>(),
                          child: AddOrEditTaskModal(existingTask: tasks[index]),
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
                    ),
                  )
                : Center(
                    child: Text(l10n.emptyTasks),
                  ),
            failed: Text.new,
          );
        },
      ),
    );
  }
}
