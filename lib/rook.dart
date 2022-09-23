import 'board.dart';
import 'cell.dart';
import 'pieces.dart';
import 'position.dart';

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
