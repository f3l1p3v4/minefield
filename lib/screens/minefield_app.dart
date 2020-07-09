import 'package:minefield/components/board_widget.dart';
import '../models/board.dart';
import 'package:flutter/material.dart';
import '../components/result_widget.dart';
import '../components/field_widget.dart';
import '../models/field.dart';
import '../models/explosion_exception.dart';

class MineFieldApp extends StatefulWidget {

  @override
  _MineFieldAppState createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool _won;
  Board _board = Board(
    lines: 12,
    columns: 12,
    numberBombs: 3,
  );

  void _restart() {
    print('restart...');
  }

  void _openUp(Field field) {
    setState(() {
      try {
        field.openUp();
      } on ExplosionException {}
    });
  }

  void _switchMarkup(Field field) {
    print('switch markup...');
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ) ,
        body: Container(
          child: BoardWidget (
            board: _board,
            onOpenUp: _openUp,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      )
    );
  }
}