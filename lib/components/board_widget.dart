import 'package:minefield/components/field_widget.dart';
import 'package:flutter/material.dart';
import '../models/field.dart';
import '../models/board.dart';

class BoardWidget extends StatelessWidget {

  final Board board;
  final void Function(Field) onOpenUp;
  final void Function(Field) onSwitchMarkup;

  BoardWidget({
    @required this.board,
    @required this.onOpenUp,
    @required this.onSwitchMarkup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields.map((c) {
          return FieldWidget(
            field: c,
            onOpenUp: onOpenUp,
            onSwitchMarkup: onSwitchMarkup,
          );
        }).toList(),
      ),
    );
  }
}