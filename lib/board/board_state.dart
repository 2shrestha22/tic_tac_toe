import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/mark.dart';

part 'board_state.freezed.dart';

typedef Board = List<Mark?>;

@freezed
class BoardState with _$BoardState {
  const BoardState._();
  const factory BoardState({
    required Board board,

    /// Turn of player
    required Mark turn,
    Mark? winner,
    required bool finished,
    WinCombo? winCombo,
  }) = _BoardState;

  factory BoardState.initial() => BoardState(
        board: Board.filled(9, null),
        turn: Mark.cross,
        winner: null,
        finished: false,
        winCombo: null,
      );
}
