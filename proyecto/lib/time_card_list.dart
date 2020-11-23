import 'package:flutter/material.dart';
import 'time_card.dart';

class TimeCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimeCard(Icons.watch_later_outlined, "Trabajo", "00:00"),
        TimeCard(Icons.assignment_outlined, "Hola", "00:00"),
        TimeCard(Icons.favorite, "Descanso", "00:00"),
      ],
    );
  }

}