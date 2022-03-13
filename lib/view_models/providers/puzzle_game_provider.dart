import 'package:flutter/material.dart';
import 'package:game/view/widgets/puzzle_piece.dart';

class PuzzleProvider extends ChangeNotifier {
  PuzzleProvider() {
    createPosition();
    createPuzzlePieces();
  }
  // all variables here
  List<PuzzlePiece> pieces = [];
  List<Offset> positions = [];
  bool timerstart = false;
  int zeroValuePositionIndex = 15;
  bool suffled = false;
  int moves = 0;
  List<String> values = List.generate(16, (index) {
    if (index == 15) {
      return "0";
    }
    return "${index + 1}";
  });
  double boxSize = 110.0;

  // all getter here
  List<PuzzlePiece> get getPieces => pieces;
  List<Offset> get getPositions => positions;
  double get getboxsize => boxSize;
  bool get istimer => timerstart;
  int get getmoves => moves;
  // all functions
  changeboxsize(double size) {
    boxSize = size;
    positions.clear();
    pieces.clear();
    createPosition();
    createPuzzlePieces();
    notifyListeners();
  }

  createPosition() {
    //this function create offsets for puzzle
    //according to size of boxSize;
    double left = 0.0, top = 0.0;
    for (var i = 0; i < 16; i++) {
      if (i != 0 && i % 4 == 0) {
        left = 0.0;
        top += boxSize + 10.0;
      }
      positions.add(Offset(left, top));
      left += boxSize + 10.0;
    }
  }

  sufflevalue() {
    timerstart = false;
    moves = 0;
    //because values are change so we have to call createPuzzlePieces
    //with new values
    values.shuffle();
    pieces.clear();
    createPuzzlePieces();
    zeroValuePositionIndex = findZeroValuePositionIndex();
    suffled = true;

    notifyListeners();
  }

  int findZeroValuePositionIndex() {
    for (var item in pieces) {
      if (item.value == "0") {
        return item.positionIndex;
      }
    }
    return -1;
  }

  createPuzzlePieces() {
    for (var i = 0; i < 16; i++) {
      pieces.add(
        PuzzlePiece(
          positionIndex: i,
          value: values[i],
        ),
      );
    }
  }

  swapPosition(int i, int j) {
    Offset temp;
    temp = positions[i];
    positions[i] = positions[j];
    positions[j] = temp;
  }

  bool checkwin() {
    if (suffled == true) {
      int check = 0;
      List<String> v = List.generate(16, (index) {
        if (index == 15) {
          return "0";
        }
        return "${index + 1}";
      });
      List<Offset> p = [];
      double left = 0.0, top = 0.0;
      for (var i = 0; i < 16; i++) {
        if (i != 0 && i % 4 == 0) {
          left = 0.0;
          top += boxSize + 10.0;
        }
        p.add(Offset(left, top));
        left += boxSize + 10.0;
      }

      for (var i = 0; i < 16; i++) {
        for (var j = 0; j < 16; j++) {
          if (v[i] == pieces[j].value &&
              p[i] == positions[pieces[j].positionIndex]) {
            check++;
          }
        }
      }
      if (check == 16) {
        return true;
      }
    }
    return false;
  }

  //*! puzzle control related function here!
  changePosition(int currentPositionIndex) {
    var clicked = 0;

    if (suffled == true) {
      Offset clickPuzzlePosition = positions[currentPositionIndex];
      Offset zeroPuzzlePosition = positions[zeroValuePositionIndex];

      if (zeroPuzzlePosition.dx + boxSize + 10.0 == clickPuzzlePosition.dx &&
          zeroPuzzlePosition.dy == clickPuzzlePosition.dy) {
        swapPosition(currentPositionIndex, zeroValuePositionIndex);
        clicked = 1;
      } else if (zeroPuzzlePosition.dx - boxSize - 10.0 ==
              clickPuzzlePosition.dx &&
          zeroPuzzlePosition.dy == clickPuzzlePosition.dy) {
        swapPosition(currentPositionIndex, zeroValuePositionIndex);
        clicked = 1;
      } else if (zeroPuzzlePosition.dx == clickPuzzlePosition.dx &&
          zeroPuzzlePosition.dy + boxSize + 10.0 == clickPuzzlePosition.dy) {
        swapPosition(currentPositionIndex, zeroValuePositionIndex);
        clicked = 1;
      } else if (zeroPuzzlePosition.dx == clickPuzzlePosition.dx &&
          zeroPuzzlePosition.dy - boxSize - 10.0 == clickPuzzlePosition.dy) {
        swapPosition(currentPositionIndex, zeroValuePositionIndex);
        clicked = 1;
      }

      if (clicked == 1) {
        timerstart = true;
        moves++;
        notifyListeners();
      }
    }
  }
}
