class TimerHIIT{
  int secTraining;
  int minTraining;
  int secRest;
  int minRest;
  int secRoundRest;
  int minRoundRest;
  int sets;
  int exercises;

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
}
