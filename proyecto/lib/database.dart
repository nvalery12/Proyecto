import 'package:proyecto/routine.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableRoutines = 'routine';
final String columnId = 'id';
final String columnName = 'name';
final String columnSecT = 'secT';
final String columnMinT = 'minT';
final String columnSecRest = 'secRest';
final String columMinRest = 'minRest';
final String columnSecRound = 'secRound';
final String columnMinRound = 'minRound';
final String columnSets = 'sets';
final String columnExercise = 'excercise';

class RoutineHelper {
  static Database _database;
  static RoutineHelper _routineHelper;

  RoutineHelper._createInstance();
  factory RoutineHelper() {
    if (_routineHelper == null) {
      _routineHelper = RoutineHelper._createInstance();
    }
    return _routineHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "rutinas.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableRoutines ( 
          $columnId integer primary key autoincrement, 
          $columnName text not null,
          $columnSecT integer,
          $columnMinT integer,
          $columnSecRest integer,
          $columMinRest integer,
          $columnSecRound integer,
          $columnMinRound integer,
          $columnSets integer,
          $columnExercise integer)
        ''');
      },
    );
    return database;
  }

  void insertRoutine(Routine rutina) async {
    var db = await this.database;
    var result = await db.insert(tableRoutines, rutina.toMap());
    print('result : $result');
  }

  Future<List<Routine>> getAlarms() async {
    List<Routine> _routines = [];

    var db = await this.database;
    var result = await db.query(tableRoutines);
    result.forEach((element) {
      var routine = Routine.fromMap(element);
      _routines.add(routine);
    });

    return _routines;
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db
        .delete(tableRoutines, where: '$columnId = ?', whereArgs: [id]);
  }
}
