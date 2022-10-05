// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BoardState {
  List<Box> get boxes => throw _privateConstructorUsedError;
  int get boardSize => throw _privateConstructorUsedError;

  /// Turn of player
  Mark get turn => throw _privateConstructorUsedError;
  Mark? get winner => throw _privateConstructorUsedError;
  bool get finished => throw _privateConstructorUsedError;
  List<Box>? get winCombo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardStateCopyWith<BoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardStateCopyWith<$Res> {
  factory $BoardStateCopyWith(
          BoardState value, $Res Function(BoardState) then) =
      _$BoardStateCopyWithImpl<$Res>;
  $Res call(
      {List<Box> boxes,
      int boardSize,
      Mark turn,
      Mark? winner,
      bool finished,
      List<Box>? winCombo});
}

/// @nodoc
class _$BoardStateCopyWithImpl<$Res> implements $BoardStateCopyWith<$Res> {
  _$BoardStateCopyWithImpl(this._value, this._then);

  final BoardState _value;
  // ignore: unused_field
  final $Res Function(BoardState) _then;

  @override
  $Res call({
    Object? boxes = freezed,
    Object? boardSize = freezed,
    Object? turn = freezed,
    Object? winner = freezed,
    Object? finished = freezed,
    Object? winCombo = freezed,
  }) {
    return _then(_value.copyWith(
      boxes: boxes == freezed
          ? _value.boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
      boardSize: boardSize == freezed
          ? _value.boardSize
          : boardSize // ignore: cast_nullable_to_non_nullable
              as int,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as Mark,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Mark?,
      finished: finished == freezed
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      winCombo: winCombo == freezed
          ? _value.winCombo
          : winCombo // ignore: cast_nullable_to_non_nullable
              as List<Box>?,
    ));
  }
}

/// @nodoc
abstract class _$$_BoardStateCopyWith<$Res>
    implements $BoardStateCopyWith<$Res> {
  factory _$$_BoardStateCopyWith(
          _$_BoardState value, $Res Function(_$_BoardState) then) =
      __$$_BoardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Box> boxes,
      int boardSize,
      Mark turn,
      Mark? winner,
      bool finished,
      List<Box>? winCombo});
}

/// @nodoc
class __$$_BoardStateCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements _$$_BoardStateCopyWith<$Res> {
  __$$_BoardStateCopyWithImpl(
      _$_BoardState _value, $Res Function(_$_BoardState) _then)
      : super(_value, (v) => _then(v as _$_BoardState));

  @override
  _$_BoardState get _value => super._value as _$_BoardState;

  @override
  $Res call({
    Object? boxes = freezed,
    Object? boardSize = freezed,
    Object? turn = freezed,
    Object? winner = freezed,
    Object? finished = freezed,
    Object? winCombo = freezed,
  }) {
    return _then(_$_BoardState(
      boxes: boxes == freezed
          ? _value._boxes
          : boxes // ignore: cast_nullable_to_non_nullable
              as List<Box>,
      boardSize: boardSize == freezed
          ? _value.boardSize
          : boardSize // ignore: cast_nullable_to_non_nullable
              as int,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as Mark,
      winner: winner == freezed
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as Mark?,
      finished: finished == freezed
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
      winCombo: winCombo == freezed
          ? _value._winCombo
          : winCombo // ignore: cast_nullable_to_non_nullable
              as List<Box>?,
    ));
  }
}

/// @nodoc

class _$_BoardState extends _BoardState {
  const _$_BoardState(
      {required final List<Box> boxes,
      required this.boardSize,
      required this.turn,
      this.winner,
      required this.finished,
      final List<Box>? winCombo})
      : _boxes = boxes,
        _winCombo = winCombo,
        super._();

  final List<Box> _boxes;
  @override
  List<Box> get boxes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boxes);
  }

  @override
  final int boardSize;

  /// Turn of player
  @override
  final Mark turn;
  @override
  final Mark? winner;
  @override
  final bool finished;
  final List<Box>? _winCombo;
  @override
  List<Box>? get winCombo {
    final value = _winCombo;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BoardState(boxes: $boxes, boardSize: $boardSize, turn: $turn, winner: $winner, finished: $finished, winCombo: $winCombo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoardState &&
            const DeepCollectionEquality().equals(other._boxes, _boxes) &&
            const DeepCollectionEquality().equals(other.boardSize, boardSize) &&
            const DeepCollectionEquality().equals(other.turn, turn) &&
            const DeepCollectionEquality().equals(other.winner, winner) &&
            const DeepCollectionEquality().equals(other.finished, finished) &&
            const DeepCollectionEquality().equals(other._winCombo, _winCombo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boxes),
      const DeepCollectionEquality().hash(boardSize),
      const DeepCollectionEquality().hash(turn),
      const DeepCollectionEquality().hash(winner),
      const DeepCollectionEquality().hash(finished),
      const DeepCollectionEquality().hash(_winCombo));

  @JsonKey(ignore: true)
  @override
  _$$_BoardStateCopyWith<_$_BoardState> get copyWith =>
      __$$_BoardStateCopyWithImpl<_$_BoardState>(this, _$identity);
}

abstract class _BoardState extends BoardState {
  const factory _BoardState(
      {required final List<Box> boxes,
      required final int boardSize,
      required final Mark turn,
      final Mark? winner,
      required final bool finished,
      final List<Box>? winCombo}) = _$_BoardState;
  const _BoardState._() : super._();

  @override
  List<Box> get boxes;
  @override
  int get boardSize;
  @override

  /// Turn of player
  Mark get turn;
  @override
  Mark? get winner;
  @override
  bool get finished;
  @override
  List<Box>? get winCombo;
  @override
  @JsonKey(ignore: true)
  _$$_BoardStateCopyWith<_$_BoardState> get copyWith =>
      throw _privateConstructorUsedError;
}
