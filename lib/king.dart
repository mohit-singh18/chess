import 'package:chess/board.dart';
import 'package:chess/cell.dart';
import 'package:chess/pieces.dart';
import 'package:chess/position.dart';

class King extends Piece {
  King(PieceType pieceType) : super(pieceType);

  @override
  List<Position> getValidMoves(Position currentPosition, List<Cell> board) {
    final validMoves = <Position>[];

    // North East
    validMoves.add(Position(currentPosition.x - 1, currentPosition.y + 1));

    // North West
    validMoves.add(Position(currentPosition.x - 1, currentPosition.y - 1));

    // South East
    validMoves.add(Position(currentPosition.x + 1, currentPosition.y + 1));

    // South West
    validMoves.add(Position(currentPosition.x + 1, currentPosition.y - 1));

    // South
    validMoves.add(Position(currentPosition.x + 1, currentPosition.y));

    // North
    validMoves.add(Position(currentPosition.x - 1, currentPosition.y));

    // East
    validMoves.add(Position(currentPosition.x, currentPosition.y + 1));

    // West
    validMoves.add(Position(currentPosition.x, currentPosition.y - 1));

    return filterOutOfBound(validMoves);
  }

  @override
  String get unicodeIcon => "\♚";

  @override
  String toString() {
    return 'King';
  }
}
