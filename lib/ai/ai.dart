import 'package:tic_tac_toe/board/board_state.dart';

import '../model/mark.dart';

class Ai {
  /// [mark] mark used by AI.
  /// [board] state of board. Denotes which square are filled and not filled.
  void getAiMove({
    required Board board,
    required Mark mark,
  }) {}

  void minimax({
    required Board board,
    required Mark mark,
  }) {}
}
