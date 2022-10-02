import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/model/mark.dart';
import 'board_state.dart';

// By using a provider, this allows us to mock/override the value exposed.
final boardProvider = StateNotifierProvider<BoardStateNotifier, BoardState>(
    (_) => BoardStateNotifier());

class BoardStateNotifier extends StateNotifier<BoardState> {
  BoardStateNotifier() : super(BoardState.initial());

  /// When human taps on board
  void onMarkFill(int pos) {
    if (state.board[pos] != null) return;

    final newMarks = List<Mark?>.from(state.board)..[pos] = state.turn;

    state = state.copyWith(
      board: newMarks,
      turn: state.turn.complement,
    );
    final winCombo = checkWin(
      turn: state.turn.complement,
      marks: state.board,
    );

    if (winCombo != null) {
      // previous (who already played) was winner, since turn will go for next
      state = state.copyWith(
        winner: state.turn.complement,
        winCombo: winCombo,
        finished: true,
      );
    } else if (!state.board.contains(null)) {
      // game is draw
      state = state.copyWith(finished: true);
    }
  }
}

/// Returns winCombo
List<int>? checkWin({
  required Mark turn,
  required List<Mark?> marks,
}) {
  /// List of position player with turn has filled
  final List<int> plays = [];

  marks.asMap().forEach((key, value) {
    value == turn ? plays.add(key) : null;
  });

  for (var element in plays) {
    log(element.toString());
  }

  List<int>? winCombo;
  for (var combo in Constants.winCombos3x3) {
    final win = combo.every((e) => plays.contains(e));
    if (win) {
      winCombo = combo;
      break;
    }
  }
  return winCombo;
}
