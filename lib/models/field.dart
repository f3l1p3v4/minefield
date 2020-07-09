import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Field {
  final int row;
  final int column;
  final List<Field> neighbors = [];

  bool _open = false;
  bool _marked = false;
  bool _undermined = false;
  bool _exploded = false;

  Field({
    @required this.row,
    @required this.column,
  });

  void addNeighbors(Field neighbor) {
    final deltaRow = (row - neighbor.row).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if(deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if(deltaRow <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void openUp() {
    if(_open) {
      return;
    }

    _open = true;

    if(_undermined) {
      _exploded = true;
      throw ExplosionException();
    }

    if(safeNeighbors) {
      neighbors.forEach((n) => n.openUp());
    }
  }

  void revealBomb() {
    if(_undermined) {
      _open = true;
    }
  }

  void undermine() {
    _undermined = true;
  }

  void switchMarkup() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _undermined = false;
    _exploded = false;
  }

  bool get undermined {
    return _undermined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get open {
    return _open;
  }

  bool get marked {
    return  _marked;
  }

  bool get sortedOut {
    bool underminedAndMarked = undermined && marked;
    bool safeAndOpen = !undermined && open;
    return underminedAndMarked || safeAndOpen;
  }

  bool get safeNeighbors {
    return neighbors.every((n) => !n.undermined);
  }

  int get numberMinesNeighborhood {
    return neighbors.where((n) => n.undermined).length;
  }
}