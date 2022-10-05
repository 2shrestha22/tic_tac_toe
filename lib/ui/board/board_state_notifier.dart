import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/engine/ai/ai.dart';
import '../../engine/board/board.dart';
import '../../engine/board/mark.dart';
import 'board_state.dart';

// By using a provider, this allows us to mock/override the value exposed.
final boardProvider = StateNotifierProvider<BoardStateNotifier, BoardState>(
    (_) => BoardStateNotifier(Board(3, 3)));

class BoardStateNotifier extends StateNotifier<BoardState> {
  BoardStateNotifier(this.board)
      : super(BoardState(
          boxes: board.elements,
          finished: false,
          turn: Mark.cross,
          boardSize: board.n,
        )) {
    board.onComplete((combo) {
      // previous (who already played) was winner, since turn will go for next
      if (combo.isNotEmpty) {
        state = state.copyWith(
          winner: state.turn.complement,
          winCombo: combo,
          finished: true,
        );
      } else {
        // game is draw
        state = state.copyWith(finished: true);
      }
    });
  }

  final Board board;

  /// When human taps on board
  void onMarkFill(int pos) {
    if (state.boxes[pos].mark != null) return;

    board.setWithIndex(state.turn, pos);

    state = state.copyWith(
      boxes: board.elements,
      turn: state.turn.complement,
    );

    final box = Ai().getBestMove(
      board: board,
      player: Mark.zero,
      isMaximizing: false,
    );
    log(box.toString());
  }
}
