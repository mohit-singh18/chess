// import 'package:chess/cell.dart';
// import 'package:chess/pieces.dart';
// import 'package:chess/position.dart';
// import 'package:firstapp/cell.dart';
// import 'package:firstapp/pieces.dart';
// import 'package:firstapp/position.dart';

import 'package:chess_game/cell.dart';
import 'package:chess_game/pieces.dart';
import 'package:chess_game/position.dart';

import 'board.dart';

class Queen extends Piece {
  Queen(PieceType pieceType) : super(pieceType);

  @override
  List<Position>? getValidMoves(Position currentPosition, List<Cell> board) {
    final allMoves = board.getColumnForPosition(currentPosition)! +
        board.getRowForPosition(currentPosition)! +
        board.getDiagonalsForPosition(currentPosition)!;
    return filterOutOfBound(allMoves);
  }

  @override
  String get unicodeIcon => "\♛";

  @override
  String toString() {
    return 'Queen';
  }
}
