// import 'package:chess/board.dart';
// import 'package:chess/cell.dart';
// import 'package:chess/pieces.dart';
// import 'package:chess/position.dart';
// import 'package:firstapp/board.dart';
// import 'package:firstapp/cell.dart';
// import 'package:firstapp/pieces.dart';
// import 'package:firstapp/position.dart';

import 'package:chess_game/board.dart';
import 'package:chess_game/cell.dart';
import 'package:chess_game/pieces.dart';
import 'package:chess_game/position.dart';

class Rook extends Piece {
  Rook(PieceType type) : super(type);

  @override
  List<Position>? getValidMoves(Position currentPosition, List<Cell> board) {
    final allMoves = board.getColumnForPosition(currentPosition)! +
        board.getRowForPosition(currentPosition)!;

    return filterOutOfBound(allMoves);
  }

  @override
  String get unicodeIcon => "\♖";

  @override
  String toString() {
    return 'Rook';
  }
}
