import 'package:flutter/material.dart';
import '../models/field.dart';

class FieldWidget extends StatelessWidget {

  final Field field;
  final void Function(Field) onOpenUp;
  final void Function(Field) onSwitchMarkup;

  FieldWidget({
    @required this.field,
    @required this.onOpenUp,
    @required this.onSwitchMarkup,
  });

  Widget _getImage() {
    int numberMines = field.numberMinesNeighborhood;

    if(field.open && field.undermined && field.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if(field.open && field.undermined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if(field.open && numberMines > 0) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else if(field.open) {
      return Image.asset('assets/images/aberto_$numberMines.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenUp(field),
      onLongPress: () => onSwitchMarkup(field),
      child: _getImage(),
    );
  }
}