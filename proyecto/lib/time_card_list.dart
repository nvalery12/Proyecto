import 'package:flutter/material.dart';
import 'time_card.dart';
import 'repetition_card.dart';

class TimeCardList extends StatelessWidget {
  int secTraining,minTraining,secRest,minRest,secRoundRest,minRoundRest,sets,exercises;
  TimeCardList(this.secTraining,this.minTraining,this.secRest,this.minRest,this.secRoundRest,this.minRoundRest,this.exercises,this.sets);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimeCard(Icons.watch_later_outlined, "Trabajo", secTraining,minTraining),
        TimeCard(Icons.assignment_outlined, "Descanso",secRest,minRest),
        RepetitionCard(Icons.add, "Ejercicios", exercises),
        TimeCard(Icons.refresh, "Reinicio de la ronda", secRoundRest,minRoundRest),
        RepetitionCard(Icons.wifi_sharp, "Rondas",sets),
      ],
    );
  }

}