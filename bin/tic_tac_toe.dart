import 'dart:io';

void main() {
  final game = TicTacToe();
  game.start();
}

class TicTacToe {
  late List<String> board;
  late String currentPlayer;
  late bool gameActive;

  TicTacToe() {
    initializeGame();
  }

  void initializeGame() {
    // Initialize board with numbers 1-9
    board = List.generate(9, (index) => (index + 1).toString());
    currentPlayer = 'X';
    gameActive = true;
  }

  void start() {
    print('\nWelcome to Tic-Tac-Toe!\n');

    while (gameActive) {
      displayBoard();
      makeMove();

      if (checkWinner()) {
        displayBoard();
        print('\nPlayer $currentPlayer wins!\n');
        playAgain();
      } else if (isBoardFull()) {
        displayBoard();
        print('\nGame is a draw!\n');
        playAgain();
      } else {
        // Switch players
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    }
  }

  void displayBoard() {
    print('\n');
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---+---+---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---+---+---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
    print('\n');
  }

  void makeMove() {
    while (true) {
      stdout.write('Player $currentPlayer, enter a number (1-9): ');
      final input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print('Invalid input. Please try again.');
        continue;
      }

      final move = int.tryParse(input);
      if (move == null || move < 1 || move > 9) {
        print('Please enter a number between 1 and 9.');
        continue;
      }

      final index = move - 1;
      if (board[index] == 'X' || board[index] == 'O') {
        print('That position is already taken. Try again.');
        continue;
      }

      board[index] = currentPlayer;
      break;
    }
  }

  bool checkWinner() {
    // Check rows
    for (var i = 0; i < 9; i += 3) {
      if (board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
        return true;
      }
    }

    // Check columns
    for (var i = 0; i < 3; i++) {
      if (board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == board[4] && board[4] == board[8]) {
      return true;
    }
    if (board[2] == board[4] && board[4] == board[6]) {
      return true;
    }

    return false;
  }

  bool isBoardFull() {
    return !board.any((cell) => cell.contains(RegExp(r'[1-9]')));
  }

  void playAgain() {
    while (true) {
      stdout.write('\nWould you like to play again? (y/n): ');
      final input = stdin.readLineSync()?.toLowerCase();

      if (input == 'y') {
        initializeGame();
        break;
      } else if (input == 'n') {
        gameActive = false;
        print('\nThanks for playing!\n');
        break;
      } else {
        print('Please enter "y" or "n".');
      }
    }
  }
}
