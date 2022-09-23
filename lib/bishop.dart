// import 'package:chess/board.dart';
// import 'package:chess/cell.dart';
// import 'package:chess/pieces.dart';
// import 'package:chess/position.dart';
import 'board.dart';
import 'pieces.dart';
import 'position.dart';
// import 'package:firstapp/board.dart';
// import 'package:firstapp/pieces.dart';
// import 'package:firstapp/position.dart';

import 'cell.dart';

class Bishop extends Piece {
  Bishop(PieceType pieceType) : super(pieceType);

  @override
  String get unicodeIcon => "\♗";

  @override
  List<Position>? getValidMoves(Position currentPosition, List<Cell> board) {
    return board.getDiagonalsForPosition(currentPosition);
  }

  @override
  String toString() {
    return 'Bishop';
  }
}
