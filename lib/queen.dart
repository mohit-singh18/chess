import 'cell.dart';
import 'pieces.dart';
import 'position.dart';

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
