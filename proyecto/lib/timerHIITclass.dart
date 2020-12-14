import 'stringAndNumbers.dart';

class TimerHIIT{
  int secTraining = 0;
  int minTraining = 0;
  int secRest = 0;
  int minRest = 0;
  int secRoundRest = 0;
  int minRoundRest = 0;
  int sets = 0;
  int exercises = 0;

  updateTrainingTime(int sec, int min){
      this.secTraining = sec;
      this.minTraining = min;
  }

  updateRestTime(int sec, int min){
    this.secRest = sec;
    this.minRest = min;
  }

  updateRoundRest(int sec, int min){
    this.secRoundRest = sec;
    this.minRoundRest = min;
  }

  updateSets(int sets){
    this.sets = sets;
  }

  updateExercises(int exercises){
    this.exercises=exercises;
  }
/*
  updateTotalTime(){
    Duration durationTotal = Duration(seconds: (((secTraining + secRest) * exercises) + secRoundRest) * sets, minutes: (((minTraining + minRest) * exercises) + minRoundRest) * sets);
    minTotal = durationTotal.inMinutes;
    secTotal = durationTotal.inSeconds % 60;
  }*/
}
