import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tic_tac_toe/model/mark.dart';
part 'box.freezed.dart';

typedef Combo = List<Box>;

@freezed
class Box with _$Box {
  const Box._();

  const factory Box({
    required Mark? value,
    required int i,
    required int j,
  }) = _Box;

  /// Map index to one dimensional array (list)
  ///
  /// index of [ij] element of matrix of size [mn].
  ///
  /// [m] number of rows [columns] number of column
  int index(int columns) => i * columns + j;

  @override
  String toString() => '[$i,$j - $value]';
}

class Board extends ValueNotifier<Combo?> {
  /// Board of size [mxn].
  ///
  /// [m] is number of rows and [n] is number of columns.
  ///
  /// [value] is null when game is not finished. If combo is empty then game is
  /// draw. If [value] is non empty list then game is won.
  Board(this.m, this.n, this.winComboLength) : super(null) {
    _elements = List<Box>.generate(m * n, (index) {
      return Box(value: null, i: index ~/ n, j: index % n);
    });
  }

  /// Number of rows.
  final int m;

  /// Number of columns
  final int n;

  final int winComboLength;

  late List<Box> _elements;

  List<Box> get elements => _elements;

  /// Get mark from ij th element.
  ///
  /// If j is null then i should be index in one dimensional array.
  Mark? get(int i, int j) => _elements[i * n + j].value;

  /// Set mark on ij th element.
  ///
  /// If j is null then i should be index in one dimensional array.
  void set(Mark mark, int i, int j) {
    _elements[i * n + j] = Box(value: mark, i: i, j: j);

    final combo = _checkWin(i, j, this);

    // notify listener when game is finished
    if (combo != null) {
      value = combo;
    }
  }
}

/// Returns winCombo in null no win if empty then it is draw.
Combo? _checkWin(int i, int j, Board board) {
  final mark = board.get(i, j);
  if (mark == null) return null;

  List<Box> combo = [];

  // check i th row for combo
  for (var n = 0; n < board.n; n++) {
    // itterate through all the elements in the column
    if (board.get(i, n) == mark) {
      combo.add(Box(value: mark, i: i, j: n));
    } else if (combo.length >= board.winComboLength) {
      break;
    } else {
      combo.clear();
    }
  }
  if (combo.length >= board.winComboLength) {
    return combo;
  } else {
    combo.clear();
  }

  // check j th column for combo
  for (var m = 0; m < board.m; m++) {
    // itterate through all the elements in the column
    if (board.get(m, j) == mark) {
      combo.add(Box(value: mark, i: m, j: j));
    } else if (combo.length >= board.winComboLength) {
      break;
    } else {
      combo.clear();
    }
  }
  if (combo.length >= board.winComboLength) {
    return combo;
  } else {
    combo.clear();
  }
  return null;
}
