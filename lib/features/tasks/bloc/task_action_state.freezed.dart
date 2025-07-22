// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskActionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) actionSucceeded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? actionSucceeded,
    TResult? Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? actionSucceeded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskActionInitialState value) initial,
    required TResult Function(ActionLoading value) loading,
    required TResult Function(ActionSucceded value) actionSucceeded,
    required TResult Function(ActionFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskActionInitialState value)? initial,
    TResult? Function(ActionLoading value)? loading,
    TResult? Function(ActionSucceded value)? actionSucceeded,
    TResult? Function(ActionFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskActionInitialState value)? initial,
    TResult Function(ActionLoading value)? loading,
    TResult Function(ActionSucceded value)? actionSucceeded,
    TResult Function(ActionFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskActionStateCopyWith<$Res> {
  factory $TaskActionStateCopyWith(
          TaskActionState value, $Res Function(TaskActionState) then) =
      _$TaskActionStateCopyWithImpl<$Res, TaskActionState>;
}

/// @nodoc
class _$TaskActionStateCopyWithImpl<$Res, $Val extends TaskActionState>
    implements $TaskActionStateCopyWith<$Res> {
  _$TaskActionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskActionInitialStateImplCopyWith<$Res> {
  factory _$$TaskActionInitialStateImplCopyWith(
          _$TaskActionInitialStateImpl value,
          $Res Function(_$TaskActionInitialStateImpl) then) =
      __$$TaskActionInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskActionInitialStateImplCopyWithImpl<$Res>
    extends _$TaskActionStateCopyWithImpl<$Res, _$TaskActionInitialStateImpl>
    implements _$$TaskActionInitialStateImplCopyWith<$Res> {
  __$$TaskActionInitialStateImplCopyWithImpl(
      _$TaskActionInitialStateImpl _value,
      $Res Function(_$TaskActionInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskActionInitialStateImpl implements TaskActionInitialState {
  const _$TaskActionInitialStateImpl();

  @override
  String toString() {
    return 'TaskActionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskActionInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) actionSucceeded,
    required TResult Function(String error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? actionSucceeded,
    TResult? Function(String error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? actionSucceeded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskActionInitialState value) initial,
    required TResult Function(ActionLoading value) loading,
    required TResult Function(ActionSucceded value) actionSucceeded,
    required TResult Function(ActionFailed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskActionInitialState value)? initial,
    TResult? Function(ActionLoading value)? loading,
    TResult? Function(ActionSucceded value)? actionSucceeded,
    TResult? Function(ActionFailed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskActionInitialState value)? initial,
    TResult Function(ActionLoading value)? loading,
    TResult Function(ActionSucceded value)? actionSucceeded,
    TResult Function(ActionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskActionInitialState implements TaskActionState {
  const factory TaskActionInitialState() = _$TaskActionInitialStateImpl;
}

/// @nodoc
abstract class _$$ActionLoadingImplCopyWith<$Res> {
  factory _$$ActionLoadingImplCopyWith(
          _$ActionLoadingImpl value, $Res Function(_$ActionLoadingImpl) then) =
      __$$ActionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActionLoadingImplCopyWithImpl<$Res>
    extends _$TaskActionStateCopyWithImpl<$Res, _$ActionLoadingImpl>
    implements _$$ActionLoadingImplCopyWith<$Res> {
  __$$ActionLoadingImplCopyWithImpl(
      _$ActionLoadingImpl _value, $Res Function(_$ActionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActionLoadingImpl implements ActionLoading {
  const _$ActionLoadingImpl();

  @override
  String toString() {
    return 'TaskActionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) actionSucceeded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? actionSucceeded,
    TResult? Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? actionSucceeded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskActionInitialState value) initial,
    required TResult Function(ActionLoading value) loading,
    required TResult Function(ActionSucceded value) actionSucceeded,
    required TResult Function(ActionFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskActionInitialState value)? initial,
    TResult? Function(ActionLoading value)? loading,
    TResult? Function(ActionSucceded value)? actionSucceeded,
    TResult? Function(ActionFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskActionInitialState value)? initial,
    TResult Function(ActionLoading value)? loading,
    TResult Function(ActionSucceded value)? actionSucceeded,
    TResult Function(ActionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ActionLoading implements TaskActionState {
  const factory ActionLoading() = _$ActionLoadingImpl;
}

/// @nodoc
abstract class _$$ActionSuccededImplCopyWith<$Res> {
  factory _$$ActionSuccededImplCopyWith(_$ActionSuccededImpl value,
          $Res Function(_$ActionSuccededImpl) then) =
      __$$ActionSuccededImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel> tasks});
}

/// @nodoc
class __$$ActionSuccededImplCopyWithImpl<$Res>
    extends _$TaskActionStateCopyWithImpl<$Res, _$ActionSuccededImpl>
    implements _$$ActionSuccededImplCopyWith<$Res> {
  __$$ActionSuccededImplCopyWithImpl(
      _$ActionSuccededImpl _value, $Res Function(_$ActionSuccededImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$ActionSuccededImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$ActionSuccededImpl implements ActionSucceded {
  const _$ActionSuccededImpl({required final List<TaskModel> tasks})
      : _tasks = tasks;

  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskActionState.actionSucceeded(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionSuccededImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionSuccededImplCopyWith<_$ActionSuccededImpl> get copyWith =>
      __$$ActionSuccededImplCopyWithImpl<_$ActionSuccededImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) actionSucceeded,
    required TResult Function(String error) failed,
  }) {
    return actionSucceeded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? actionSucceeded,
    TResult? Function(String error)? failed,
  }) {
    return actionSucceeded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? actionSucceeded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (actionSucceeded != null) {
      return actionSucceeded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskActionInitialState value) initial,
    required TResult Function(ActionLoading value) loading,
    required TResult Function(ActionSucceded value) actionSucceeded,
    required TResult Function(ActionFailed value) failed,
  }) {
    return actionSucceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskActionInitialState value)? initial,
    TResult? Function(ActionLoading value)? loading,
    TResult? Function(ActionSucceded value)? actionSucceeded,
    TResult? Function(ActionFailed value)? failed,
  }) {
    return actionSucceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskActionInitialState value)? initial,
    TResult Function(ActionLoading value)? loading,
    TResult Function(ActionSucceded value)? actionSucceeded,
    TResult Function(ActionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (actionSucceeded != null) {
      return actionSucceeded(this);
    }
    return orElse();
  }
}

abstract class ActionSucceded implements TaskActionState {
  const factory ActionSucceded({required final List<TaskModel> tasks}) =
      _$ActionSuccededImpl;

  List<TaskModel> get tasks;

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionSuccededImplCopyWith<_$ActionSuccededImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionFailedImplCopyWith<$Res> {
  factory _$$ActionFailedImplCopyWith(
          _$ActionFailedImpl value, $Res Function(_$ActionFailedImpl) then) =
      __$$ActionFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ActionFailedImplCopyWithImpl<$Res>
    extends _$TaskActionStateCopyWithImpl<$Res, _$ActionFailedImpl>
    implements _$$ActionFailedImplCopyWith<$Res> {
  __$$ActionFailedImplCopyWithImpl(
      _$ActionFailedImpl _value, $Res Function(_$ActionFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ActionFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionFailedImpl implements ActionFailed {
  const _$ActionFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'TaskActionState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionFailedImplCopyWith<_$ActionFailedImpl> get copyWith =>
      __$$ActionFailedImplCopyWithImpl<_$ActionFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) actionSucceeded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? actionSucceeded,
    TResult? Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? actionSucceeded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskActionInitialState value) initial,
    required TResult Function(ActionLoading value) loading,
    required TResult Function(ActionSucceded value) actionSucceeded,
    required TResult Function(ActionFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskActionInitialState value)? initial,
    TResult? Function(ActionLoading value)? loading,
    TResult? Function(ActionSucceded value)? actionSucceeded,
    TResult? Function(ActionFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskActionInitialState value)? initial,
    TResult Function(ActionLoading value)? loading,
    TResult Function(ActionSucceded value)? actionSucceeded,
    TResult Function(ActionFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ActionFailed implements TaskActionState {
  const factory ActionFailed({required final String error}) =
      _$ActionFailedImpl;

  String get error;

  /// Create a copy of TaskActionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionFailedImplCopyWith<_$ActionFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
