import 'dart:ui';
import 'pieces.dart';
import 'position.dart';
import 'package:flutter/material.dart';

class Cell {
  final Position position;
  final Piece? piece;
  final bool isSelected;
  final bool isHighlighted;

  Cell(
    this.position, {
    this.piece,
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
