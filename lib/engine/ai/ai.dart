import 'dart:math';

import '../board/board.dart';
import '../board/mark.dart';

class Eval {
  Eval(this.box, this.value);

  final Box box;
  final int value;
}

class Ai {
  Box getBestMove({
    /// Current state of board.
    required Board board,

    /// Whose move is it?
    /// let say AI (O) is always minimizing player. and human (X) is always
    /// maximizing player.
    required Mark player,
    required bool isMaximizing,
  }) {
    return minimax(board: board, player: player, isMaximizing: isMaximizing)
        .box;
  }

  /// Return max possible value from the board.
  Eval minimax({
    /// Current state of board.
    required Board board,

    /// Whose move is it?
    /// let say AI (O) is always minimizing player. and human (X) is always
    /// maximizing player.
    required Mark player,
    required bool isMaximizing,
  }) {
    // it still have moves
    // final combo = board.checkWin(x, y);
    final List<Box> availableMoves =
        board.elements.where((e) => e.mark == null).toList();

    final winCombo = board.checkWin();

    if (winCombo != null) {
      if (winCombo.isNotEmpty) {
        /// game is completed
        if (winCombo.first.mark == Mark.cross) {
          // if maximizing player wins
          return Eval(board.lastMove!, 10);
        } else {
          // if minimizing player wins
          return Eval(board.lastMove!, -10);
        }
      } else {
        // game is over and noone won.
        return Eval(board.lastMove!, 0);
      }
    }

    if (isMaximizing) {
      var maxEval = Eval(board.lastMove!, -1000);
      for (var e in availableMoves) {
        final newBoard = board;
        final eval = minimax(
          board: newBoard..set(player, e.x, e.y),
          player: player.complement,
          isMaximizing: !isMaximizing,
        );
        maxEval = Eval(e, max(eval.value, maxEval.value));
      }
      return maxEval;
    } else {
      var minEval = Eval(board.lastMove!, 1000);

      for (var e in availableMoves) {
        final newBoard = board;
        final eval = minimax(
          board: newBoard..set(player, e.x, e.y),
          player: player.complement,
          isMaximizing: !isMaximizing,
        );
        minEval = Eval(e, min(eval.value, minEval.value));
      }
      return minEval;
    }
  }
}
