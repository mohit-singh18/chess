import 'package:chess/board.dart';
import 'package:chess/cell.dart';
import 'package:chess/pieces.dart';
import 'package:chess/position.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final title = 'Chess';
  List<Cell> board;
  PieceType currentTurn;
  Cell selectedCell;
  int selectedCellIndex;
  List<Position> validMoves;

  @override
  void initState() {
    board = Board.getInitialBoardState();
    currentTurn = PieceType.south;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBoard(),
            SizedBox(height: 48),
            Text(
              currentTurn == PieceType.south ? "White's Turn" : "Black's Turn",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBoard() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => _onCellTap(index),
          child: _buildCell(index),
        );
      },
      itemCount: 8 * 8,
    );
  }

  Widget _buildCell(int index) {
    return Container(
      decoration: BoxDecoration(
        color: board[index].color,
        border: _getCellBorder(board[index]),
      ),
      child: Center(
        child: Text(
          board[index].piece?.unicodeIcon ?? "",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: board[index].piece?.color ?? Colors.redAccent,
          ),
        ),
      ),
    );
  }

  // TODO: Create helper methods on board & cell to simplify this method
  void _onCellTap(int index) {
    setState(() {
      // Clear all borders
      for (var index = 0; index < board.length; index++) {
        board[index] = Cell(
          board[index].position,
          piece: board[index].piece,
          isHighlighted: false,
          isSelected: false,
        );
      }

      // Clear selected state if a selected cell is tapped again
      if (selectedCellIndex == index) {
        selectedCell = null;
        selectedCellIndex = 0;
        return;
      }

      // Move
      if (selectedCell != null &&
          validMoves.isNotEmpty &&
          validMoves.contains(board[index].position)) {
        board[selectedCellIndex] = Cell(
          selectedCell.position,
        );

        board[index] = Cell(
          board[index].position,
          piece: selectedCell.piece,
          isHighlighted: false,
          isSelected: false,
        );
        selectedCell = null;
        currentTurn =
            currentTurn == PieceType.north ? PieceType.south : PieceType.north;
        return;
      }

      // Do nothing if a cell contains piece of the other player
      if (board[index].piece?.type != currentTurn) {
        return;
      }

      // Do nothing else if there is no piece set on the cell tapped
      if (board[index].piece == null) {
        return;
      }

      // Set selected cell state
      selectedCell = board[index];
      selectedCellIndex = index;

      // Add border to selected cell
      board[index] = Cell(
        board[index].position,
        piece: board[index].piece,
        isHighlighted: false,
        isSelected: true,
      );

      // Set valid moves state
      validMoves =
          board[index].piece?.getValidMoves(board[index].position, board);

      // Add border to cells which are valid moves
      validMoves?.forEach((position) {
        var cellIndexForPosition = board.getCellIndexForPosition(position);
        board[cellIndexForPosition] = Cell(
          board[cellIndexForPosition].position,
          piece: board[cellIndexForPosition].piece,
          isHighlighted: true,
          isSelected: false,
        );
      });
    });
  }

  Border _getCellBorder(Cell cell) {
    // Highlight selected cell and potential moves
    if (cell.isHighlighted) {
      return Border.all(
        color: Colors.greenAccent,
        width: 2,
      );
    } else if (cell.isSelected) {
      return Border.all(
        color: Colors.redAccent,
        width: 2,
      );
    } else {
      return null;
    }
  }
}
