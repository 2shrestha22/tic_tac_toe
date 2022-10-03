import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/model/board.dart';
import 'package:tic_tac_toe/model/mark.dart';

void main() {
  test('Board is working properly.', () {
    final board = Board(3, 3, 3);

    board.addListener(() {
      if (board.value != null) {
        for (var element in board.value!) {
          log(element.toString());
        }
      }
    });

    board.set(Mark.cross, 0, 0);
    board.set(Mark.zero, 0, 1);
    board.set(Mark.cross, 0, 2);
    board.set(Mark.cross, 1, 2);
    board.set(Mark.cross, 2, 2);
  });
}
