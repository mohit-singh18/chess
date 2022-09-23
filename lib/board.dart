// import 'package:chess/cell.dart';
// import 'package:chess/pawn.dart';
// import 'package:chess/pieces.dart';
// import 'package:chess/position.dart';
// import 'package:chess/queen.dart';
// import 'package:chess/rook.dart';
import 'package:chess_game/cell.dart';
import 'package:chess_game/pawn.dart';
import 'package:chess_game/pieces.dart';
import 'package:chess_game/position.dart';
import 'package:chess_game/queen.dart';
import 'package:chess_game/rook.dart';
// import 'package:firstapp/cell.dart';
// import 'package:firstapp/pawn.dart';
// import 'package:firstapp/pieces.dart';
// import 'package:firstapp/position.dart';
// import 'package:firstapp/queen.dart';
// import 'package:firstapp/rook.dart';

import 'bishop.dart';
import 'king.dart';
import 'knight.dart';

extension Board on List<Cell> {
  static List<Cell> getInitialBoardState() {
    final northCells = [
      Cell(Position(0, 0), piece: Rook(PieceType.north)),
      Cell(Position(0, 1), piece: Knight(PieceType.north)),
      Cell(Position(0, 2), piece: Bishop(PieceType.north)),
      Cell(Position(0, 3), piece: King(PieceType.north)),
      Cell(Position(0, 4), piece: Queen(PieceType.north)),
      Cell(Position(0, 5), piece: Bishop(PieceType.north)),
      Cell(Position(0, 6), piece: Knight(PieceType.north)),
      Cell(Position(0, 7), piece: Rook(PieceType.north)),
      Cell(Position(1, 0), piece: Pawn(PieceType.north)),
      Cell(Position(1, 1), piece: Pawn(PieceType.north)),
      Cell(Position(1, 2), piece: Pawn(PieceType.north)),
      Cell(Position(1, 3), piece: Pawn(PieceType.north)),
      Cell(Position(1, 4), piece: Pawn(PieceType.north)),
      Cell(Position(1, 5), piece: Pawn(PieceType.north)),
      Cell(Position(1, 6), piece: Pawn(PieceType.north)),
      Cell(Position(1, 7), piece: Pawn(PieceType.north)),
    ];

    final middleCells = List.generate(8, (index) => Cell(Position(2, index))) +
        List.generate(8, (index) => Cell(Position(3, index))) +
        List.generate(8, (index) => Cell(Position(4, index))) +
        List.generate(8, (index) => Cell(Position(5, index)));

    final southCells = [
      Cell(Position(6, 0), piece: Pawn(PieceType.south)),
      Cell(Position(6, 1), piece: Pawn(PieceType.south)),
      Cell(Position(6, 2), piece: Pawn(PieceType.south)),
      Cell(Position(6, 3), piece: Pawn(PieceType.south)),
      Cell(Position(6, 4), piece: Pawn(PieceType.south)),
      Cell(Position(6, 5), piece: Pawn(PieceType.south)),
      Cell(Position(6, 6), piece: Pawn(PieceType.south)),
      Cell(Position(6, 7), piece: Pawn(PieceType.south)),
      Cell(Position(7, 0), piece: Rook(PieceType.south)),
      Cell(Position(7, 1), piece: Knight(PieceType.south)),
      Cell(Position(7, 2), piece: Bishop(PieceType.south)),
      Cell(Position(7, 3), piece: Queen(PieceType.south)),
      Cell(Position(7, 4), piece: King(PieceType.south)),
      Cell(Position(7, 5), piece: Bishop(PieceType.south)),
      Cell(Position(7, 6), piece: Knight(PieceType.south)),
      Cell(Position(7, 7), piece: Rook(PieceType.south)),
    ];

    return northCells + middleCells + southCells;
  }

  bool isPositionInBounds(Position position) {
    return (position.x >= 0 && position.x <= this.length) &&
        (position.y >= 0 && position.y <= this.length);
  }

  List<Position>? getDiagonalsForPosition(Position currentPosition) {
    return this.map((e) => e.position).where((position) {
      return currentPosition != position &&
          ((currentPosition.x - position.x).abs() ==
              (currentPosition.y - position.y).abs());
    }).toList();
  }

  List<Position>? getRowForPosition(Position currentPosition) {
    final positions = <Position>[];
    for (var y = currentPosition.y + 1; y <= 7; y++) {
      positions.add(Position(currentPosition.x, y));
    }
    for (var y = currentPosition.y - 1; y >= 0; y--) {
      positions.add(Position(currentPosition.x, y));
    }
    return positions;
  }

  List<Position>? getColumnForPosition(Position currentPosition) {
    final positions = <Position>[];
    for (var x = currentPosition.x + 1; x <= 7; x++) {
      positions.add(Position(x, currentPosition.y));
    }
    // South
    for (var x = currentPosition.x - 1; x >= 0; x--) {
      positions.add(Position(x, currentPosition.y));
    }
    return positions;
  }

  int getCellIndexForPosition(Position position) {
    return position.x * 8 + position.y;
  }
}

// TODO find a better place for this method
List<Position>? filterOutOfBound(List<Position> positions) {
  return positions
      .where((element) =>
          element.x <= 7 && element.x >= 0 && element.y >= 0 && element.y <= 7)
      .toList();
}
