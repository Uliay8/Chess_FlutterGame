import 'package:chess_fluttergame/components/piece.dart';
import 'package:chess_fluttergame/components/square.dart';
import 'package:chess_fluttergame/helper/helper_methods.dart';
import 'package:chess_fluttergame/values/colors.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //list = chessboard
  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //Place pawns
    for (var i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: false,
          imagePath: 'lib/images/pawn.png');
      newBoard[6][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: true,
          imagePath: 'lib/images/pawn.png');
      //Place rooks
      if (i == 0 || i == 7) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.rook,
            isWhite: false,
            imagePath: 'lib/images/rook.png');
        newBoard[7][i] = ChessPiece(
            type: ChessPieceType.rook,
            isWhite: true,
            imagePath: 'lib/images/rook.png');
        continue;
      }
      //Place knights
      if (i == 1 || i == 6) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.knight,
            isWhite: false,
            imagePath: 'lib/images/knight.png');
        newBoard[7][i] = ChessPiece(
            type: ChessPieceType.knight,
            isWhite: true,
            imagePath: 'lib/images/knight.png');
        continue;
      }
      //Place bishops
      if (i == 2 || i == 5) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.bishop,
            isWhite: false,
            imagePath: 'lib/images/bishop.png');
        newBoard[7][i] = ChessPiece(
            type: ChessPieceType.bishop,
            isWhite: true,
            imagePath: 'lib/images/bishop.png');
        continue;
      }
      //Place queens
      if (i == 3) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.queen,
            isWhite: false,
            imagePath: 'lib/images/queen.png');
        newBoard[7][i] = ChessPiece(
            type: ChessPieceType.queen,
            isWhite: true,
            imagePath: 'lib/images/queen.png');
        continue;
      }
      if (i == 4) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.king,
            isWhite: false,
            imagePath: 'lib/images/king.png');
        newBoard[7][i] = ChessPiece(
            type: ChessPieceType.king,
            isWhite: true,
            imagePath: 'lib/images/king.png');
        continue;
      }
      //Place kings
    }
    board = newBoard;
  }

//user selected a piece
  void pieceSelected(int row, int col) {
    setState(() {
      //select a piece if there is a piece in that position
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedCol = col;
        selectedRow = row;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: foregroundColor,
        body: GridView.builder(
          itemCount: 8 * 8,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          itemBuilder: (context, index) {
            int row = index ~/ 8;
            int col = index % 8;
            // check is square is selected
            bool isSelected = selectedRow == row && selectedCol == col;

            return Square(
              isWhite: isWhite(index),
              piece: board[row][col],
              isSelected: isSelected,
              onTap: () => pieceSelected(row, col),
            );
          },
        ));
  }
}
