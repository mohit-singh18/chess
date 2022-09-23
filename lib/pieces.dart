// import 'package:chess/cell.dart';
// import 'package:chess/position.dart';
// import 'package:firstapp/cell.dart';
// import 'package:firstapp/position.dart';
import 'package:chess_game/cell.dart';
import 'package:chess_game/position.dart';
import 'package:flutter/material.dart';

enum PieceType {
  north,
  south,
}

abstract class Piece {
  final PieceType type;

  Piece(this.type);

  Color get color => type == PieceType.north ? Colors.black : Colors.white;

  String toString();

  String get unicodeIcon;

  List<Position>? getValidMoves(Position currentPosition, List<Cell> board);
}
