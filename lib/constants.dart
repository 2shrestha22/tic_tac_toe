class Constants {
  const Constants._();

  static const audioPrefix = 'assets/';

  /// Win combos in 3x3 board
  static const winCombos3x3 = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ];
}
