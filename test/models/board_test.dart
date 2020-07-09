import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/board.dart';

main() {
  test('Win game',() {

    Board board = Board(
      lines: 2,
      columns: 2,
      numberBombs: 0,
    );

    board.fields[0].undermine();
    board.fields[3].undermine();

    //Playing...
    board.fields[0].switchMarkup();
    board.fields[1].openUp();
    board.fields[2].openUp();
    board.fields[3].switchMarkup();

    expect(board.sortedOut, isTrue);
  }); 
}