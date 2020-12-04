import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'timerHIITclass.dart';

class Routine{
  int id;
  String name;
  TimerHIIT timerHIIT;

  Routine(this.name, this.timerHIIT,{this.id});

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'secT': timerHIIT.secTraining,
      'minT': timerHIIT.minTraining,
      'secRest': timerHIIT.secRest,
      'minReset': timerHIIT.minRest,
      'secRound': timerHIIT.secRoundRest,
      'minRound': timerHIIT.minRoundRest,
      'sets': timerHIIT.sets,
      'exercise': timerHIIT.exercises,
    };
  }

  Routine.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    timerHIIT.secTraining = map['secT'];
    timerHIIT.minTraining = map['minT'];
    timerHIIT.secRest = map['secRest'];
    timerHIIT.minRest = map['minRest'];
    timerHIIT.secRoundRest = map['secRound'];
    timerHIIT.minRoundRest = map['minRound'];
    timerHIIT.sets = map['sets'];
    timerHIIT.exercises = map['exercise'];
    id = map['id'];
  }
}

class RoutineDatabase {
  Database _db;

  initDB() async{
    _db= await openDatabase('my_db.db',version: 1,
        onCreate: (Database db, int version){
          db.execute('CREATE TABLE routine (id INTEGER PRIMARY KEY, name TEXT, secT INTEGER, minT INTEGER, secRest INTEGER, minRest INTEGER, secRound INTEGER, minRound INTEGER, sets INTEGER, exercise INTEGER);');
        }
        );
  }

  insert(Routine routine) async{
    _db.insert('routine', routine.toMap());
  }

  Future<List<Routine>> getAllRoutines() async{
    List<Map<String,dynamic>> result= await _db.query('routine');
    
    return result.map((map) => Routine.fromMap(map)).toList();
  }
}