import 'package:chess/cell.dart';
import 'package:chess/pieces.dart';
import 'package:chess/position.dart';

import 'board.dart';

class Knight extends Piece {
  Knight(PieceType pieceType) : super(pieceType);

  @override
  List<Position> getValidMoves(Position currentPosition, List<Cell> board) {
    final bottomLeft = Position(currentPosition.x + 2, currentPosition.y - 1);
    final topLeft = Position(currentPosition.x - 2, currentPosition.y - 1);
    final bottomRight = Position(currentPosition.x - 2, currentPosition.y + 1);
    final topRight = Position(currentPosition.x + 2, currentPosition.y + 1);

    var validMoves = <Position>[bottomLeft, topLeft, topRight, bottomRight];
    return filterOutOfBound(validMoves);
  }

  @override
  String get unicodeIcon => "\♘";

  @override
  String toString() {
    return 'Knight';
  }
}
