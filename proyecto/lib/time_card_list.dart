import 'package:flutter/material.dart';
import 'time_card.dart';
import 'repetition_card.dart';
import 'timerHIITclass.dart';

class TimeCardList extends StatelessWidget {
  TimerHIIT timerHIIT;
  TimeCardList(this.timerHIIT);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimeCard(Icons.watch_later_outlined, "Trabajo", timerHIIT.secTraining,timerHIIT.minTraining),
        TimeCard(Icons.assignment_outlined, "Descanso",timerHIIT.secRest,timerHIIT.minRest),
        RepetitionCard(Icons.add, "Ejercicios", timerHIIT.exercises),
        TimeCard(Icons.refresh, "Reinicio de la ronda", timerHIIT.secRoundRest,timerHIIT.minRoundRest),
        RepetitionCard(Icons.wifi_sharp, "Rondas",timerHIIT.sets),
      ],
    );
  }

}