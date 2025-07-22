// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get tasks => 'Tareas';

  @override
  String get emptyTasks => 'No hay tareas';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get editTaskTitle => 'Editar tarea';

  @override
  String get createTaskTitle => 'Crear tarea';

  @override
  String get statusLabel => 'Estado';

  @override
  String get titleLabel => 'Título';

  @override
  String get titleRequired => 'El título es obligatorio';

  @override
  String get descriptionLabel => 'Descripción';

  @override
  String get descriptionRequired => 'La descripción es obligatoria';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get createTask => 'Crear tarea';

  @override
  String get pending => 'Pendiente';

  @override
  String get pendingPlural => 'Pendientes';

  @override
  String get completed => 'Completada';

  @override
  String get completedPlural => 'Completadas';

  @override
  String get inProgress => 'En curso';

  @override
  String get assignedTo => 'Assigned to';

  @override
  String get assignationRequired => 'La asignación es obligatoria';

  @override
  String get all => 'Todas';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteTask => 'Eliminar tarea';

  @override
  String get deleteTaskQuestion => '¿Eliminar tarea?';

  @override
  String get deleteTaskDescription =>
      'Esta acción no se puede deshacer. ¿Estás seguro de que querés eliminar esta tarea?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get iaMode => 'Modo IA';

  @override
  String get iaInstructions => 'Instrucción para IA';

  @override
  String get iaInstructionsHint => 'Describe qué tarea necesitas crear...';

  @override
  String get actionError => 'No se ha podido realizar la acción';

  @override
  String get tagsLabel => 'Etiquetas';

  @override
  String get tagsHint => 'Añadir etiquetas para identificar la tarea';

  @override
  String taskSummary(Object completed, Object pending) {
    return 'Tienes $pending tareas pendientes y $completed tareas completadas.';
  }
}
