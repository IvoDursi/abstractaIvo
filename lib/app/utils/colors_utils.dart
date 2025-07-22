import 'package:abstracta_repository/model/task_model.dart';
import 'package:flutter/material.dart';

class ColorsUtils {
  Color getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Colors.orange;
      case TaskStatus.completed:
        return Colors.green;
      case TaskStatus.inProgress:
        return Colors.blue;
    }
  }
}
