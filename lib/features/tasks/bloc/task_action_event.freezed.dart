// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_action_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskActionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) removeTask,
    required TResult Function(String? title, String? description,
            String? prompt, String assignedTo, List<String> labels)
        addTask,
    required TResult Function(
            String title,
            String description,
            String assignedTo,
            TaskStatus status,
            String taskId,
            List<String> labels)
        editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? removeTask,
    TResult? Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult? Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? removeTask,
    TResult Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveTask value) removeTask,
    required TResult Function(AddTask value) addTask,
    required TResult Function(EditTask value) editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveTask value)? removeTask,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(EditTask value)? editTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveTask value)? removeTask,
    TResult Function(AddTask value)? addTask,
    TResult Function(EditTask value)? editTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskActionEventCopyWith<$Res> {
  factory $TaskActionEventCopyWith(
          TaskActionEvent value, $Res Function(TaskActionEvent) then) =
      _$TaskActionEventCopyWithImpl<$Res, TaskActionEvent>;
}

/// @nodoc
class _$TaskActionEventCopyWithImpl<$Res, $Val extends TaskActionEvent>
    implements $TaskActionEventCopyWith<$Res> {
  _$TaskActionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemoveTaskImplCopyWith<$Res> {
  factory _$$RemoveTaskImplCopyWith(
          _$RemoveTaskImpl value, $Res Function(_$RemoveTaskImpl) then) =
      __$$RemoveTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$RemoveTaskImplCopyWithImpl<$Res>
    extends _$TaskActionEventCopyWithImpl<$Res, _$RemoveTaskImpl>
    implements _$$RemoveTaskImplCopyWith<$Res> {
  __$$RemoveTaskImplCopyWithImpl(
      _$RemoveTaskImpl _value, $Res Function(_$RemoveTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$RemoveTaskImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveTaskImpl implements RemoveTask {
  const _$RemoveTaskImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskActionEvent.removeTask(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveTaskImplCopyWith<_$RemoveTaskImpl> get copyWith =>
      __$$RemoveTaskImplCopyWithImpl<_$RemoveTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) removeTask,
    required TResult Function(String? title, String? description,
            String? prompt, String assignedTo, List<String> labels)
        addTask,
    required TResult Function(
            String title,
            String description,
            String assignedTo,
            TaskStatus status,
            String taskId,
            List<String> labels)
        editTask,
  }) {
    return removeTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? removeTask,
    TResult? Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult? Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
  }) {
    return removeTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? removeTask,
    TResult Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
    required TResult orElse(),
  }) {
    if (removeTask != null) {
      return removeTask(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveTask value) removeTask,
    required TResult Function(AddTask value) addTask,
    required TResult Function(EditTask value) editTask,
  }) {
    return removeTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveTask value)? removeTask,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(EditTask value)? editTask,
  }) {
    return removeTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveTask value)? removeTask,
    TResult Function(AddTask value)? addTask,
    TResult Function(EditTask value)? editTask,
    required TResult orElse(),
  }) {
    if (removeTask != null) {
      return removeTask(this);
    }
    return orElse();
  }
}

abstract class RemoveTask implements TaskActionEvent {
  const factory RemoveTask({required final String taskId}) = _$RemoveTaskImpl;

  String get taskId;

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveTaskImplCopyWith<_$RemoveTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTaskImplCopyWith<$Res> {
  factory _$$AddTaskImplCopyWith(
          _$AddTaskImpl value, $Res Function(_$AddTaskImpl) then) =
      __$$AddTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? prompt,
      String assignedTo,
      List<String> labels});
}

/// @nodoc
class __$$AddTaskImplCopyWithImpl<$Res>
    extends _$TaskActionEventCopyWithImpl<$Res, _$AddTaskImpl>
    implements _$$AddTaskImplCopyWith<$Res> {
  __$$AddTaskImplCopyWithImpl(
      _$AddTaskImpl _value, $Res Function(_$AddTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? prompt = freezed,
    Object? assignedTo = null,
    Object? labels = null,
  }) {
    return _then(_$AddTaskImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddTaskImpl implements AddTask {
  const _$AddTaskImpl(
      {required this.title,
      required this.description,
      required this.prompt,
      required this.assignedTo,
      required final List<String> labels})
      : _labels = labels;

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? prompt;
  @override
  final String assignedTo;
  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  String toString() {
    return 'TaskActionEvent.addTask(title: $title, description: $description, prompt: $prompt, assignedTo: $assignedTo, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTaskImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, prompt,
      assignedTo, const DeepCollectionEquality().hash(_labels));

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      __$$AddTaskImplCopyWithImpl<_$AddTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) removeTask,
    required TResult Function(String? title, String? description,
            String? prompt, String assignedTo, List<String> labels)
        addTask,
    required TResult Function(
            String title,
            String description,
            String assignedTo,
            TaskStatus status,
            String taskId,
            List<String> labels)
        editTask,
  }) {
    return addTask(title, description, prompt, assignedTo, labels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? removeTask,
    TResult? Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult? Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
  }) {
    return addTask?.call(title, description, prompt, assignedTo, labels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? removeTask,
    TResult Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(title, description, prompt, assignedTo, labels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveTask value) removeTask,
    required TResult Function(AddTask value) addTask,
    required TResult Function(EditTask value) editTask,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveTask value)? removeTask,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(EditTask value)? editTask,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveTask value)? removeTask,
    TResult Function(AddTask value)? addTask,
    TResult Function(EditTask value)? editTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class AddTask implements TaskActionEvent {
  const factory AddTask(
      {required final String? title,
      required final String? description,
      required final String? prompt,
      required final String assignedTo,
      required final List<String> labels}) = _$AddTaskImpl;

  String? get title;
  String? get description;
  String? get prompt;
  String get assignedTo;
  List<String> get labels;

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTaskImplCopyWith<_$AddTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditTaskImplCopyWith<$Res> {
  factory _$$EditTaskImplCopyWith(
          _$EditTaskImpl value, $Res Function(_$EditTaskImpl) then) =
      __$$EditTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String description,
      String assignedTo,
      TaskStatus status,
      String taskId,
      List<String> labels});
}

/// @nodoc
class __$$EditTaskImplCopyWithImpl<$Res>
    extends _$TaskActionEventCopyWithImpl<$Res, _$EditTaskImpl>
    implements _$$EditTaskImplCopyWith<$Res> {
  __$$EditTaskImplCopyWithImpl(
      _$EditTaskImpl _value, $Res Function(_$EditTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? assignedTo = null,
    Object? status = null,
    Object? taskId = null,
    Object? labels = null,
  }) {
    return _then(_$EditTaskImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      assignedTo: null == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$EditTaskImpl implements EditTask {
  const _$EditTaskImpl(
      {required this.title,
      required this.description,
      required this.assignedTo,
      required this.status,
      required this.taskId,
      required final List<String> labels})
      : _labels = labels;

  @override
  final String title;
  @override
  final String description;
  @override
  final String assignedTo;
  @override
  final TaskStatus status;
  @override
  final String taskId;
  final List<String> _labels;
  @override
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  String toString() {
    return 'TaskActionEvent.editTask(title: $title, description: $description, assignedTo: $assignedTo, status: $status, taskId: $taskId, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTaskImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, assignedTo,
      status, taskId, const DeepCollectionEquality().hash(_labels));

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTaskImplCopyWith<_$EditTaskImpl> get copyWith =>
      __$$EditTaskImplCopyWithImpl<_$EditTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) removeTask,
    required TResult Function(String? title, String? description,
            String? prompt, String assignedTo, List<String> labels)
        addTask,
    required TResult Function(
            String title,
            String description,
            String assignedTo,
            TaskStatus status,
            String taskId,
            List<String> labels)
        editTask,
  }) {
    return editTask(title, description, assignedTo, status, taskId, labels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? removeTask,
    TResult? Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult? Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
  }) {
    return editTask?.call(
        title, description, assignedTo, status, taskId, labels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? removeTask,
    TResult Function(String? title, String? description, String? prompt,
            String assignedTo, List<String> labels)?
        addTask,
    TResult Function(String title, String description, String assignedTo,
            TaskStatus status, String taskId, List<String> labels)?
        editTask,
    required TResult orElse(),
  }) {
    if (editTask != null) {
      return editTask(title, description, assignedTo, status, taskId, labels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveTask value) removeTask,
    required TResult Function(AddTask value) addTask,
    required TResult Function(EditTask value) editTask,
  }) {
    return editTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveTask value)? removeTask,
    TResult? Function(AddTask value)? addTask,
    TResult? Function(EditTask value)? editTask,
  }) {
    return editTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveTask value)? removeTask,
    TResult Function(AddTask value)? addTask,
    TResult Function(EditTask value)? editTask,
    required TResult orElse(),
  }) {
    if (editTask != null) {
      return editTask(this);
    }
    return orElse();
  }
}

abstract class EditTask implements TaskActionEvent {
  const factory EditTask(
      {required final String title,
      required final String description,
      required final String assignedTo,
      required final TaskStatus status,
      required final String taskId,
      required final List<String> labels}) = _$EditTaskImpl;

  String get title;
  String get description;
  String get assignedTo;
  TaskStatus get status;
  String get taskId;
  List<String> get labels;

  /// Create a copy of TaskActionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditTaskImplCopyWith<_$EditTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
