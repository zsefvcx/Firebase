// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocStateCopyWith<$Res> {
  factory $MainBlocStateCopyWith(
          MainBlocState value, $Res Function(MainBlocState) then) =
      _$MainBlocStateCopyWithImpl<$Res, MainBlocState>;
}

/// @nodoc
class _$MainBlocStateCopyWithImpl<$Res, $Val extends MainBlocState>
    implements $MainBlocStateCopyWith<$Res> {
  _$MainBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadingStateCopyWith<$Res> {
  factory _$$_loadingStateCopyWith(
          _$_loadingState value, $Res Function(_$_loadingState) then) =
      __$$_loadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_loadingState>
    implements _$$_loadingStateCopyWith<$Res> {
  __$$_loadingStateCopyWithImpl(
      _$_loadingState _value, $Res Function(_$_loadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingState implements _loadingState {
  const _$_loadingState();

  @override
  String toString() {
    return 'MainBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
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
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements MainBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_loadedStateCopyWith<$Res> {
  factory _$$_loadedStateCopyWith(
          _$_loadedState value, $Res Function(_$_loadedState) then) =
      __$$_loadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchasesListEntities> data});
}

/// @nodoc
class __$$_loadedStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_loadedState>
    implements _$$_loadedStateCopyWith<$Res> {
  __$$_loadedStateCopyWithImpl(
      _$_loadedState _value, $Res Function(_$_loadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_loadedState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PurchasesListEntities>,
    ));
  }
}

/// @nodoc

class _$_loadedState implements _loadedState {
  const _$_loadedState({required final List<PurchasesListEntities> data})
      : _data = data;

  final List<PurchasesListEntities> _data;
  @override
  List<PurchasesListEntities> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MainBlocState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadedState &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      __$$_loadedStateCopyWithImpl<_$_loadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loadedState implements MainBlocState {
  const factory _loadedState(
      {required final List<PurchasesListEntities> data}) = _$_loadedState;

  List<PurchasesListEntities> get data;
  @JsonKey(ignore: true)
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_errorStateCopyWith<$Res> {
  factory _$$_errorStateCopyWith(
          _$_errorState value, $Res Function(_$_errorState) then) =
      __$$_errorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_errorStateCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_errorState>
    implements _$$_errorStateCopyWith<$Res> {
  __$$_errorStateCopyWithImpl(
      _$_errorState _value, $Res Function(_$_errorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_errorState implements _errorState {
  const _$_errorState();

  @override
  String toString() {
    return 'MainBlocState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_errorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _errorState implements MainBlocState {
  const factory _errorState() = _$_errorState;
}

/// @nodoc
abstract class _$$_timeOutCopyWith<$Res> {
  factory _$$_timeOutCopyWith(
          _$_timeOut value, $Res Function(_$_timeOut) then) =
      __$$_timeOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_timeOutCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_timeOut>
    implements _$$_timeOutCopyWith<$Res> {
  __$$_timeOutCopyWithImpl(_$_timeOut _value, $Res Function(_$_timeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_timeOut implements _timeOut {
  const _$_timeOut();

  @override
  String toString() {
    return 'MainBlocState.timeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_timeOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class _timeOut implements MainBlocState {
  const factory _timeOut() = _$_timeOut;
}

/// @nodoc
abstract class _$$_isBusyCopyWith<$Res> {
  factory _$$_isBusyCopyWith(_$_isBusy value, $Res Function(_$_isBusy) then) =
      __$$_isBusyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_isBusyCopyWithImpl<$Res>
    extends _$MainBlocStateCopyWithImpl<$Res, _$_isBusy>
    implements _$$_isBusyCopyWith<$Res> {
  __$$_isBusyCopyWithImpl(_$_isBusy _value, $Res Function(_$_isBusy) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_isBusy implements _isBusy {
  const _$_isBusy();

  @override
  String toString() {
    return 'MainBlocState.isBusy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_isBusy);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PurchasesListEntities> data) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
    required TResult Function() isBusy,
  }) {
    return isBusy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PurchasesListEntities> data)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
    TResult? Function()? isBusy,
  }) {
    return isBusy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PurchasesListEntities> data)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    TResult Function()? isBusy,
    required TResult orElse(),
  }) {
    if (isBusy != null) {
      return isBusy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
    required TResult Function(_isBusy value) isBusy,
  }) {
    return isBusy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
    TResult? Function(_isBusy value)? isBusy,
  }) {
    return isBusy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    TResult Function(_isBusy value)? isBusy,
    required TResult orElse(),
  }) {
    if (isBusy != null) {
      return isBusy(this);
    }
    return orElse();
  }
}

abstract class _isBusy implements MainBlocState {
  const factory _isBusy() = _$_isBusy;
}

/// @nodoc
mixin _$MainBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBlocEventCopyWith<$Res> {
  factory $MainBlocEventCopyWith(
          MainBlocEvent value, $Res Function(MainBlocEvent) then) =
      _$MainBlocEventCopyWithImpl<$Res, MainBlocEvent>;
}

/// @nodoc
class _$MainBlocEventCopyWithImpl<$Res, $Val extends MainBlocEvent>
    implements $MainBlocEventCopyWith<$Res> {
  _$MainBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initEventCopyWith<$Res> {
  factory _$$_initEventCopyWith(
          _$_initEvent value, $Res Function(_$_initEvent) then) =
      __$$_initEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_initEvent>
    implements _$$_initEventCopyWith<$Res> {
  __$$_initEventCopyWithImpl(
      _$_initEvent _value, $Res Function(_$_initEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initEvent implements _initEvent {
  const _$_initEvent();

  @override
  String toString() {
    return 'MainBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements MainBlocEvent {
  const factory _initEvent() = _$_initEvent;
}

/// @nodoc
abstract class _$$_getAllEventCopyWith<$Res> {
  factory _$$_getAllEventCopyWith(
          _$_getAllEvent value, $Res Function(_$_getAllEvent) then) =
      __$$_getAllEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool sortFilter, bool buyFilter});
}

/// @nodoc
class __$$_getAllEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_getAllEvent>
    implements _$$_getAllEventCopyWith<$Res> {
  __$$_getAllEventCopyWithImpl(
      _$_getAllEvent _value, $Res Function(_$_getAllEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortFilter = null,
    Object? buyFilter = null,
  }) {
    return _then(_$_getAllEvent(
      sortFilter: null == sortFilter
          ? _value.sortFilter
          : sortFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      buyFilter: null == buyFilter
          ? _value.buyFilter
          : buyFilter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_getAllEvent implements _getAllEvent {
  const _$_getAllEvent({required this.sortFilter, required this.buyFilter});

  @override
  final bool sortFilter;
  @override
  final bool buyFilter;

  @override
  String toString() {
    return 'MainBlocEvent.getAll(sortFilter: $sortFilter, buyFilter: $buyFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getAllEvent &&
            (identical(other.sortFilter, sortFilter) ||
                other.sortFilter == sortFilter) &&
            (identical(other.buyFilter, buyFilter) ||
                other.buyFilter == buyFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortFilter, buyFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getAllEventCopyWith<_$_getAllEvent> get copyWith =>
      __$$_getAllEventCopyWithImpl<_$_getAllEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return getAll(sortFilter, buyFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return getAll?.call(sortFilter, buyFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(sortFilter, buyFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _getAllEvent implements MainBlocEvent {
  const factory _getAllEvent(
      {required final bool sortFilter,
      required final bool buyFilter}) = _$_getAllEvent;

  bool get sortFilter;
  bool get buyFilter;
  @JsonKey(ignore: true)
  _$$_getAllEventCopyWith<_$_getAllEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_addEventCopyWith<$Res> {
  factory _$$_addEventCopyWith(
          _$_addEvent value, $Res Function(_$_addEvent) then) =
      __$$_addEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Purchase data});

  $PurchaseCopyWith<$Res> get data;
}

/// @nodoc
class __$$_addEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_addEvent>
    implements _$$_addEventCopyWith<$Res> {
  __$$_addEventCopyWithImpl(
      _$_addEvent _value, $Res Function(_$_addEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_addEvent(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Purchase,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseCopyWith<$Res> get data {
    return $PurchaseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$_addEvent implements _addEvent {
  const _$_addEvent({required this.data});

  @override
  final Purchase data;

  @override
  String toString() {
    return 'MainBlocEvent.add(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addEvent &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addEventCopyWith<_$_addEvent> get copyWith =>
      __$$_addEventCopyWithImpl<_$_addEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return add(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return add?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _addEvent implements MainBlocEvent {
  const factory _addEvent({required final Purchase data}) = _$_addEvent;

  Purchase get data;
  @JsonKey(ignore: true)
  _$$_addEventCopyWith<_$_addEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_modEventCopyWith<$Res> {
  factory _$$_modEventCopyWith(
          _$_modEvent value, $Res Function(_$_modEvent) then) =
      __$$_modEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, Purchase data});

  $PurchaseCopyWith<$Res> get data;
}

/// @nodoc
class __$$_modEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_modEvent>
    implements _$$_modEventCopyWith<$Res> {
  __$$_modEventCopyWithImpl(
      _$_modEvent _value, $Res Function(_$_modEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
  }) {
    return _then(_$_modEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Purchase,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseCopyWith<$Res> get data {
    return $PurchaseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$_modEvent implements _modEvent {
  const _$_modEvent({required this.id, required this.data});

  @override
  final String id;
  @override
  final Purchase data;

  @override
  String toString() {
    return 'MainBlocEvent.mod(id: $id, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_modEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_modEventCopyWith<_$_modEvent> get copyWith =>
      __$$_modEventCopyWithImpl<_$_modEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return mod(id, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return mod?.call(id, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (mod != null) {
      return mod(id, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return mod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return mod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (mod != null) {
      return mod(this);
    }
    return orElse();
  }
}

abstract class _modEvent implements MainBlocEvent {
  const factory _modEvent(
      {required final String id, required final Purchase data}) = _$_modEvent;

  String get id;
  Purchase get data;
  @JsonKey(ignore: true)
  _$$_modEventCopyWith<_$_modEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_remEventCopyWith<$Res> {
  factory _$$_remEventCopyWith(
          _$_remEvent value, $Res Function(_$_remEvent) then) =
      __$$_remEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, bool grp});
}

/// @nodoc
class __$$_remEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_remEvent>
    implements _$$_remEventCopyWith<$Res> {
  __$$_remEventCopyWithImpl(
      _$_remEvent _value, $Res Function(_$_remEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? grp = null,
  }) {
    return _then(_$_remEvent(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      grp: null == grp
          ? _value.grp
          : grp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_remEvent implements _remEvent {
  const _$_remEvent({required this.id, required this.grp});

  @override
  final String id;
  @override
  final bool grp;

  @override
  String toString() {
    return 'MainBlocEvent.rem(id: $id, grp: $grp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_remEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.grp, grp) || other.grp == grp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, grp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_remEventCopyWith<_$_remEvent> get copyWith =>
      __$$_remEventCopyWithImpl<_$_remEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return rem(id, grp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return rem?.call(id, grp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (rem != null) {
      return rem(id, grp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return rem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return rem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (rem != null) {
      return rem(this);
    }
    return orElse();
  }
}

abstract class _remEvent implements MainBlocEvent {
  const factory _remEvent({required final String id, required final bool grp}) =
      _$_remEvent;

  String get id;
  bool get grp;
  @JsonKey(ignore: true)
  _$$_remEventCopyWith<_$_remEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_remAllEventCopyWith<$Res> {
  factory _$$_remAllEventCopyWith(
          _$_remAllEvent value, $Res Function(_$_remAllEvent) then) =
      __$$_remAllEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_remAllEventCopyWithImpl<$Res>
    extends _$MainBlocEventCopyWithImpl<$Res, _$_remAllEvent>
    implements _$$_remAllEventCopyWith<$Res> {
  __$$_remAllEventCopyWithImpl(
      _$_remAllEvent _value, $Res Function(_$_remAllEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_remAllEvent implements _remAllEvent {
  const _$_remAllEvent();

  @override
  String toString() {
    return 'MainBlocEvent.remAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_remAllEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool sortFilter, bool buyFilter) getAll,
    required TResult Function(Purchase data) add,
    required TResult Function(String id, Purchase data) mod,
    required TResult Function(String id, bool grp) rem,
    required TResult Function() remAll,
  }) {
    return remAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool sortFilter, bool buyFilter)? getAll,
    TResult? Function(Purchase data)? add,
    TResult? Function(String id, Purchase data)? mod,
    TResult? Function(String id, bool grp)? rem,
    TResult? Function()? remAll,
  }) {
    return remAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool sortFilter, bool buyFilter)? getAll,
    TResult Function(Purchase data)? add,
    TResult Function(String id, Purchase data)? mod,
    TResult Function(String id, bool grp)? rem,
    TResult Function()? remAll,
    required TResult orElse(),
  }) {
    if (remAll != null) {
      return remAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_addEvent value) add,
    required TResult Function(_modEvent value) mod,
    required TResult Function(_remEvent value) rem,
    required TResult Function(_remAllEvent value) remAll,
  }) {
    return remAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_addEvent value)? add,
    TResult? Function(_modEvent value)? mod,
    TResult? Function(_remEvent value)? rem,
    TResult? Function(_remAllEvent value)? remAll,
  }) {
    return remAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getAllEvent value)? getAll,
    TResult Function(_addEvent value)? add,
    TResult Function(_modEvent value)? mod,
    TResult Function(_remEvent value)? rem,
    TResult Function(_remAllEvent value)? remAll,
    required TResult orElse(),
  }) {
    if (remAll != null) {
      return remAll(this);
    }
    return orElse();
  }
}

abstract class _remAllEvent implements MainBlocEvent {
  const factory _remAllEvent() = _$_remAllEvent;
}
