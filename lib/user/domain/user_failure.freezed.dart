// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserFailureTearOff {
  const _$UserFailureTearOff();

  _Connect connect(String? errorMessage) {
    return _Connect(
      errorMessage,
    );
  }

  _Disconnect disconnect(String? errorMessage) {
    return _Disconnect(
      errorMessage,
    );
  }
}

/// @nodoc
const $UserFailure = _$UserFailureTearOff();

/// @nodoc
mixin _$UserFailure {
  String? get errorMessage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) connect,
    required TResult Function(String? errorMessage) disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFailureCopyWith<UserFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFailureCopyWith<$Res> {
  factory $UserFailureCopyWith(
          UserFailure value, $Res Function(UserFailure) then) =
      _$UserFailureCopyWithImpl<$Res>;
  $Res call({String? errorMessage});
}

/// @nodoc
class _$UserFailureCopyWithImpl<$Res> implements $UserFailureCopyWith<$Res> {
  _$UserFailureCopyWithImpl(this._value, this._then);

  final UserFailure _value;
  // ignore: unused_field
  final $Res Function(UserFailure) _then;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ConnectCopyWith<$Res> implements $UserFailureCopyWith<$Res> {
  factory _$ConnectCopyWith(_Connect value, $Res Function(_Connect) then) =
      __$ConnectCopyWithImpl<$Res>;
  @override
  $Res call({String? errorMessage});
}

/// @nodoc
class __$ConnectCopyWithImpl<$Res> extends _$UserFailureCopyWithImpl<$Res>
    implements _$ConnectCopyWith<$Res> {
  __$ConnectCopyWithImpl(_Connect _value, $Res Function(_Connect) _then)
      : super(_value, (v) => _then(v as _Connect));

  @override
  _Connect get _value => super._value as _Connect;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_Connect(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Connect extends _Connect {
  const _$_Connect(this.errorMessage) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserFailure.connect(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Connect &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  _$ConnectCopyWith<_Connect> get copyWith =>
      __$ConnectCopyWithImpl<_Connect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) connect,
    required TResult Function(String? errorMessage) disconnect,
  }) {
    return connect(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
  }) {
    return connect?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _Connect extends UserFailure {
  const factory _Connect(String? errorMessage) = _$_Connect;
  const _Connect._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$ConnectCopyWith<_Connect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DisconnectCopyWith<$Res>
    implements $UserFailureCopyWith<$Res> {
  factory _$DisconnectCopyWith(
          _Disconnect value, $Res Function(_Disconnect) then) =
      __$DisconnectCopyWithImpl<$Res>;
  @override
  $Res call({String? errorMessage});
}

/// @nodoc
class __$DisconnectCopyWithImpl<$Res> extends _$UserFailureCopyWithImpl<$Res>
    implements _$DisconnectCopyWith<$Res> {
  __$DisconnectCopyWithImpl(
      _Disconnect _value, $Res Function(_Disconnect) _then)
      : super(_value, (v) => _then(v as _Disconnect));

  @override
  _Disconnect get _value => super._value as _Disconnect;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_Disconnect(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Disconnect extends _Disconnect {
  const _$_Disconnect(this.errorMessage) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserFailure.disconnect(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Disconnect &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  _$DisconnectCopyWith<_Disconnect> get copyWith =>
      __$DisconnectCopyWithImpl<_Disconnect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) connect,
    required TResult Function(String? errorMessage) disconnect,
  }) {
    return disconnect(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
  }) {
    return disconnect?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? connect,
    TResult Function(String? errorMessage)? disconnect,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connect value) connect,
    required TResult Function(_Disconnect value) disconnect,
  }) {
    return disconnect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
  }) {
    return disconnect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connect value)? connect,
    TResult Function(_Disconnect value)? disconnect,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(this);
    }
    return orElse();
  }
}

abstract class _Disconnect extends UserFailure {
  const factory _Disconnect(String? errorMessage) = _$_Disconnect;
  const _Disconnect._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$DisconnectCopyWith<_Disconnect> get copyWith =>
      throw _privateConstructorUsedError;
}
