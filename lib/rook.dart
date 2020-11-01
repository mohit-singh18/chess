import 'package:chess/board.dart';
import 'package:chess/cell.dart';
import 'package:chess/pieces.dart';
import 'package:chess/position.dart';

class Rook extends Piece {
  Rook(PieceType type) : super(type);

  @override
  List<Position> getValidMoves(Position currentPosition, List<Cell> board) {
    final allMoves = board.getColumnForPosition(currentPosition) +
        board.getRowForPosition(currentPosition);

    return filterOutOfBound(allMoves);
  }

  @override
  String get unicodeIcon => "\♖";

  @override
  String toString() {
    return 'Rook';
  }
}
