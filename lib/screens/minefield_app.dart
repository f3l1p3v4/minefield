import 'package:flutter/material.dart';
import '../components/result_widget.dart';
import '../components/field_widget.dart';
import '../models/field.dart';
import '../models/explosion_exception.dart';

class MineFieldApp extends StatelessWidget {

  void _restart() {
    print('restart...');
  }

  void _openUp(Field field) {
    print('openUp...');
  }

  void _switchMarkup(Field field) {
    print('switch markup...');
  }

  @override
  Widget build(BuildContext context) {
    Field neighbor1 = Field(row: 1, column: 0);
    neighbor1.undermine();

    Field field = Field(row: 0, column: 0);
    field.addNeighbors(neighbor1);

    try {
      // field.undermine();
      field.openUp();
    } on ExplosionException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: false,
          onRestart: _restart,
        ) ,
        body: Container(
          child: FieldWidget(
            field: field,
            onOpenUp: _openUp,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      )
    );
  }
}