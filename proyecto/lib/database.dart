import 'dart:async';
import 'package:sqflite/sqflite.dart';

class Routine{
  int id;
  String name;
  int secT;
  int minT;
  int secRest;
  int minRest;
  int secRound;
  int minRound;
  int sets;
  int exercise;

  Routine(this.id,this.name, this.secT, this.minT, this.secRest, this.minRest,
      this.secRound, this.minRound, this.sets, this.exercise);

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'secT': secT,
      'minT': minT,
      'secRest': secRest,
      'minReset': minRest,
      'secRound': secRound,
      'minRound': minRound,
      'sets': sets,
      'exercise': exercise,
    };
  }

  Routine.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    secT = map['secT'];
    minT = map['minT'];
    secRest = map['secRest'];
    minRest = map['minRest'];
    secRound = map['secRound'];
    minRound = map['minRound'];
    sets = map['sets'];
    exercise = map['exercise'];
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