import 'board.dart';
import 'cell.dart';
import 'pieces.dart';
import 'position.dart';

class Pawn extends Piece {
  Pawn(PieceType pieceType) : super(pieceType);

  @override
  String get unicodeIcon => "\♙";

  @override
  List<Position>? getValidMoves(Position currentPosition, List<Cell> board) {
    final validMoves = <Position>[];
    final forward = type == PieceType.north
        ? Position(currentPosition.x + 1, currentPosition.y)
        : Position(currentPosition.x - 1, currentPosition.y);
    final leftDiagonal = type == PieceType.north
        ? Position(currentPosition.x + 1, currentPosition.y + 1)
        : Position(currentPosition.x - 1, currentPosition.y - 1);
    final rightDiagonal = type == PieceType.north
        ? Position(currentPosition.x + 1, currentPosition.y - 1)
        : Position(currentPosition.x - 1, currentPosition.y + 1);
    final skipForward = type == PieceType.north
        ? Position(currentPosition.x + 2, currentPosition.y)
        : Position(currentPosition.x - 2, currentPosition.y);

    validMoves.add(forward);
    validMoves.add(leftDiagonal);
    validMoves.add(rightDiagonal);

    if (type == PieceType.north && currentPosition.x == 1 ||
        type == PieceType.south && currentPosition.x == 6) {
      validMoves.add(skipForward);
    }

    return filterOutOfBound(validMoves);
  }

  @override
  String toString() {
    return 'Pawn';
  }
}
