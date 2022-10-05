import 'package:freezed_annotation/freezed_annotation.dart';

import '../../engine/board/board.dart';
import '../../engine/board/mark.dart';

part 'board_state.freezed.dart';

// typedef Board = List<Mark?>;

@freezed
class BoardState with _$BoardState {
  const BoardState._();
  const factory BoardState({
    required List<Box> boxes,
    required int boardSize,

    /// Turn of player
    required Mark turn,
    Mark? winner,
    required bool finished,
    List<Box>? winCombo,
  }) = _BoardState;
}
