import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/mark.dart';

part 'board_state.freezed.dart';

@freezed
class BoardState with _$BoardState {
  const BoardState._();
  const factory BoardState({
    required List<Mark?> marks,

    /// Turn of player
    required Mark turn,
    Mark? winner,
    required bool finished,
    List<int>? winCombo,
  }) = _BoardState;

  factory BoardState.initial() => BoardState(
        marks: List<Mark?>.filled(9, null),
        turn: Mark.cross,
        winner: null,
        finished: false,
        winCombo: null,
      );
}
