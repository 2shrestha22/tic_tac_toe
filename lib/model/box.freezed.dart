// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Box {
  Mark? get value => throw _privateConstructorUsedError;
  int get i => throw _privateConstructorUsedError;
  int get j => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoxCopyWith<Box> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxCopyWith<$Res> {
  factory $BoxCopyWith(Box value, $Res Function(Box) then) =
      _$BoxCopyWithImpl<$Res>;
  $Res call({Mark? value, int i, int j});
}

/// @nodoc
class _$BoxCopyWithImpl<$Res> implements $BoxCopyWith<$Res> {
  _$BoxCopyWithImpl(this._value, this._then);

  final Box _value;
  // ignore: unused_field
  final $Res Function(Box) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? i = freezed,
    Object? j = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Mark?,
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      j: j == freezed
          ? _value.j
          : j // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BoxCopyWith<$Res> implements $BoxCopyWith<$Res> {
  factory _$$_BoxCopyWith(_$_Box value, $Res Function(_$_Box) then) =
      __$$_BoxCopyWithImpl<$Res>;
  @override
  $Res call({Mark? value, int i, int j});
}

/// @nodoc
class __$$_BoxCopyWithImpl<$Res> extends _$BoxCopyWithImpl<$Res>
    implements _$$_BoxCopyWith<$Res> {
  __$$_BoxCopyWithImpl(_$_Box _value, $Res Function(_$_Box) _then)
      : super(_value, (v) => _then(v as _$_Box));

  @override
  _$_Box get _value => super._value as _$_Box;

  @override
  $Res call({
    Object? value = freezed,
    Object? i = freezed,
    Object? j = freezed,
  }) {
    return _then(_$_Box(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Mark?,
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      j: j == freezed
          ? _value.j
          : j // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Box extends _Box {
  const _$_Box({required this.value, required this.i, required this.j})
      : super._();

  @override
  final Mark? value;
  @override
  final int i;
  @override
  final int j;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Box &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.i, i) &&
            const DeepCollectionEquality().equals(other.j, j));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(i),
      const DeepCollectionEquality().hash(j));

  @JsonKey(ignore: true)
  @override
  _$$_BoxCopyWith<_$_Box> get copyWith =>
      __$$_BoxCopyWithImpl<_$_Box>(this, _$identity);
}

abstract class _Box extends Box {
  const factory _Box(
      {required final Mark? value,
      required final int i,
      required final int j}) = _$_Box;
  const _Box._() : super._();

  @override
  Mark? get value;
  @override
  int get i;
  @override
  int get j;
  @override
  @JsonKey(ignore: true)
  _$$_BoxCopyWith<_$_Box> get copyWith => throw _privateConstructorUsedError;
}
