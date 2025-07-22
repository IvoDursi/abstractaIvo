// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskStatus? status) get,
    required TResult Function(List<TaskModel>? tasks) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus? status)? get,
    TResult? Function(List<TaskModel>? tasks)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskStatus? status)? get,
    TResult Function(List<TaskModel>? tasks)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTasks value) get,
    required TResult Function(RefreshTasks value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTasks value)? get,
    TResult? Function(RefreshTasks value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTasks value)? get,
    TResult Function(RefreshTasks value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksEventCopyWith<$Res> {
  factory $TasksEventCopyWith(
          TasksEvent value, $Res Function(TasksEvent) then) =
      _$TasksEventCopyWithImpl<$Res, TasksEvent>;
}

/// @nodoc
class _$TasksEventCopyWithImpl<$Res, $Val extends TasksEvent>
    implements $TasksEventCopyWith<$Res> {
  _$TasksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTasksImplCopyWith<$Res> {
  factory _$$GetTasksImplCopyWith(
          _$GetTasksImpl value, $Res Function(_$GetTasksImpl) then) =
      __$$GetTasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskStatus? status});
}

/// @nodoc
class __$$GetTasksImplCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$GetTasksImpl>
    implements _$$GetTasksImplCopyWith<$Res> {
  __$$GetTasksImplCopyWithImpl(
      _$GetTasksImpl _value, $Res Function(_$GetTasksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$GetTasksImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus?,
    ));
  }
}

/// @nodoc

class _$GetTasksImpl implements GetTasks {
  const _$GetTasksImpl({this.status});

  @override
  final TaskStatus? status;

  @override
  String toString() {
    return 'TasksEvent.get(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksImplCopyWith<_$GetTasksImpl> get copyWith =>
      __$$GetTasksImplCopyWithImpl<_$GetTasksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskStatus? status) get,
    required TResult Function(List<TaskModel>? tasks) refresh,
  }) {
    return get(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus? status)? get,
    TResult? Function(List<TaskModel>? tasks)? refresh,
  }) {
    return get?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskStatus? status)? get,
    TResult Function(List<TaskModel>? tasks)? refresh,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTasks value) get,
    required TResult Function(RefreshTasks value) refresh,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTasks value)? get,
    TResult? Function(RefreshTasks value)? refresh,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTasks value)? get,
    TResult Function(RefreshTasks value)? refresh,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetTasks implements TasksEvent {
  const factory GetTasks({final TaskStatus? status}) = _$GetTasksImpl;

  TaskStatus? get status;

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksImplCopyWith<_$GetTasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshTasksImplCopyWith<$Res> {
  factory _$$RefreshTasksImplCopyWith(
          _$RefreshTasksImpl value, $Res Function(_$RefreshTasksImpl) then) =
      __$$RefreshTasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel>? tasks});
}

/// @nodoc
class __$$RefreshTasksImplCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$RefreshTasksImpl>
    implements _$$RefreshTasksImplCopyWith<$Res> {
  __$$RefreshTasksImplCopyWithImpl(
      _$RefreshTasksImpl _value, $Res Function(_$RefreshTasksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = freezed,
  }) {
    return _then(_$RefreshTasksImpl(
      tasks: freezed == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
    ));
  }
}

/// @nodoc

class _$RefreshTasksImpl implements RefreshTasks {
  const _$RefreshTasksImpl({final List<TaskModel>? tasks}) : _tasks = tasks;

  final List<TaskModel>? _tasks;
  @override
  List<TaskModel>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TasksEvent.refresh(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTasksImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTasksImplCopyWith<_$RefreshTasksImpl> get copyWith =>
      __$$RefreshTasksImplCopyWithImpl<_$RefreshTasksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskStatus? status) get,
    required TResult Function(List<TaskModel>? tasks) refresh,
  }) {
    return refresh(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus? status)? get,
    TResult? Function(List<TaskModel>? tasks)? refresh,
  }) {
    return refresh?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskStatus? status)? get,
    TResult Function(List<TaskModel>? tasks)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTasks value) get,
    required TResult Function(RefreshTasks value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTasks value)? get,
    TResult? Function(RefreshTasks value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTasks value)? get,
    TResult Function(RefreshTasks value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshTasks implements TasksEvent {
  const factory RefreshTasks({final List<TaskModel>? tasks}) =
      _$RefreshTasksImpl;

  List<TaskModel>? get tasks;

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTasksImplCopyWith<_$RefreshTasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
