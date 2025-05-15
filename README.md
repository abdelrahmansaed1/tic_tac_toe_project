# Tic-Tac-Toe Console Game

A simple console-based Tic-Tac-Toe game implemented in Dart. This game allows two players to take turns making moves on a 3x3 grid until one player wins or the game ends in a draw.

## Features

- Interactive 3x3 game board
- Two-player gameplay (X and O)
- Input validation
- Win detection (rows, columns, and diagonals)
- Draw detection
- Option to play again after game completion
- Clear console interface

## Requirements

- Dart SDK (>=2.12.0)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/tic_tac_toe.git
cd tic_tac_toe
```

2. Get dependencies:
```bash
dart pub get
```

## How to Run

Run the game using the following command:
```bash
dart run bin/tic_tac_toe.dart
```

## How to Play

1. The game board is numbered from 1 to 9, corresponding to the positions on the board:
```
 1 | 2 | 3 
---+---+---
 4 | 5 | 6 
---+---+---
 7 | 8 | 9 
```

2. Players take turns entering a number (1-9) to place their marker (X or O) in the corresponding position.
3. The first player to get three of their markers in a row (horizontally, vertically, or diagonally) wins.
4. If all positions are filled and no player has won, the game is declared a draw.
5. After each game, players can choose to play again or exit.

## Game Rules

- Player X goes first
- Players must enter a valid number between 1 and 9
- Players cannot choose a position that is already taken
- The game ends when either:
  - A player wins by getting three in a row
  - The board is full (draw)
  - Players choose not to play again

## Code Structure

The game is implemented using a `TicTacToe` class that handles:
- Game board management
- Player turns
- Move validation
- Win/draw detection
- Game state management 