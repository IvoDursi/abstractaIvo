// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tasks => 'Tasks';

  @override
  String get emptyTasks => 'No tasks';

  @override
  String get statistics => 'Statistics';

  @override
  String get editTaskTitle => 'Edit Task';

  @override
  String get createTaskTitle => 'Create Task';

  @override
  String get statusLabel => 'Status';

  @override
  String get titleLabel => 'Title';

  @override
  String get titleRequired => 'Title is required';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get descriptionRequired => 'Description is required';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get createTask => 'Create Task';

  @override
  String get pending => 'Pending';

  @override
  String get pendingPlural => 'Pending';

  @override
  String get completed => 'Completed';

  @override
  String get completedPlural => 'Completed';

  @override
  String get inProgress => 'In progress';

  @override
  String get assignedTo => 'Assigned to';

  @override
  String get assignationRequired => 'Assignation required';

  @override
  String get all => 'All';

  @override
  String get delete => 'Delete';

  @override
  String get deleteTask => 'Remove task';

  @override
  String get deleteTaskQuestion => 'Delete task?';

  @override
  String get deleteTaskDescription =>
      'This action can\'t be undone. Are you sure you want to delete this task?';

  @override
  String get cancel => 'Cancel';

  @override
  String get iaMode => 'IA Mode';

  @override
  String get iaInstructions => 'Instruction for AI';

  @override
  String get iaInstructionsHint => 'Describe what task you need to create...';

  @override
  String get actionError => 'The action could not be performed';

  @override
  String get tagsLabel => 'Tags';

  @override
  String get tagsHint => 'Add tags to identify the task';

  @override
  String taskSummary(Object completed, Object pending) {
    return 'You have $pending pending tasks and $completed completed tasks.';
  }
}
