class Position {
  final int x;
  final int y;

  Position(
    this.x,
    this.y,
  );

  @override
  String toString() {
    return '$x, $y';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
