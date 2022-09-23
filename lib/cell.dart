import 'dart:ui';

// import 'package:chess/pieces.dart';
// import 'package:chess/position.dart';
import 'package:chess_game/pieces.dart';
import 'package:chess_game/position.dart';
// import 'package:firstapp/pieces.dart';
// import 'package:firstapp/position.dart';
import 'package:flutter/material.dart';

class Cell {
  final Position position;
  final Piece? piece;
  final bool isSelected;
  final bool isHighlighted;

  Cell(
    this.position, {
    this.piece = null,
    bool? isSelected,
    bool? isHighlighted,
  })  : this.isSelected = isSelected ?? false,
        this.isHighlighted = isHighlighted ?? false;

  Color get color {
    return (position.x % 2) == (position.y % 2)
        ? const Color.fromRGBO(112, 102, 119, 1)
        : const Color.fromRGBO(204, 183, 174, 1);
  }
}
