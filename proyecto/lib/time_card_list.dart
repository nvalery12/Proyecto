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
        TimeCard(Icons.watch_later_outlined, "Trabajo", timerHIIT.secTraining,timerHIIT.minTraining,timerHIIT.updateTrainingTime),
        TimeCard(Icons.favorite_border, "Descanso",timerHIIT.secRest,timerHIIT.minRest,timerHIIT.updateRestTime),
        RepetitionCard(Icons.alarm_add_outlined, "Ejercicios", timerHIIT.exercises,timerHIIT.updateExercises),
        TimeCard(Icons.refresh, "Reinicio de ronda", timerHIIT.secRoundRest,timerHIIT.minRoundRest,timerHIIT.updateRoundRest),
        RepetitionCard(Icons.add_box_outlined, "Rondas",timerHIIT.sets,timerHIIT.updateSets),
      ],
    );
  }

}