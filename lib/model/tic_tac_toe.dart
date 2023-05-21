class TicTacToe {
  final _board = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  var _moves = 0;
  int winner = 0;
  
  void resetGame() {
    winner = 0;
    _moves = 0;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        _board[i][j] = 0;
      }
    }
  }

  int getBoard({required int row, required int column}) {
    return _board[row][column];
  }

// return 3 for illegal move
// return 2 for draw
// return 1 for player 1
// return 0 for result pending
// return -1 for player 2

  int move({required int player, required int row, required int column}) {
    // Check for illegal move
    if (_moves == 9 || winner.abs() == 1) return 3;
    _moves++;
    _board[row][column] = player;

    int winRow = 0, winColumn = 0, winDiagonal = 0, winRDiagonal = 0;
    for (var i = 0; i < 3; i++) {
      // Check for horizontal
      winRow += _board[i][column];
      // Check for vertical
      winColumn += _board[row][i];
      // Check for diagonal
      winDiagonal += _board[i][i];
      // Check for reverse diagonal
      winRDiagonal += _board[i][2 - i];
    }

    if (winRow.abs() == 3 ||
        winColumn.abs() == 3 ||
        winDiagonal.abs() == 3 ||
        winRDiagonal.abs() == 3) {
      winner = player;
      return player;
    }
    // Check for draw 
    if (_moves == 9) return 2;
    return 0;
  }
}
