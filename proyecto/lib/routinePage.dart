import 'package:flutter/material.dart';
import 'package:proyecto/database.dart';
import 'routine.dart';
import 'timerHIITclass.dart';

class RoutinePage extends StatefulWidget {
  RoutineHelper _routineHelper = RoutineHelper();
  Future<List<Routine>> _routines;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RoutinePage();
  }
}

class _RoutinePage extends State<RoutinePage> {
  RoutineHelper _routineHelper = RoutineHelper();
  Future<List<Routine>> _routines;

  @override
  void initState() {
    _routineHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadRoutines();
    });
  }

  void loadRoutines() {
    _routines = _routineHelper.getAlarms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: FutureBuilder<List<Routine>>(
        future: _routines,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: snapshot.data.map<Widget>((elemento) {
                ListTile(
                  title: Text(elemento.name),
                );
              }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),*/
      body: Center(
        child: Text('Probando'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoutine,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  /* _ShowList(BuildContext context) {
    return FutureBuilder(
      future: db.getAllRoutines(),
      initialData: List<Routine>(),
      builder: (BuildContext context, AsyncSnapshot<List<Routine>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: <Widget>[
              for (Routine routine in snapshot.data)
                ListTile(
                  title: Text(routine.name),
                )
            ],
          );
        } else {
          return Center(
            child: Text('Agrega rutinas.'),
          );
        }
      },
    );*/

  void _addRoutine() {
    TimerHIIT timerHIIT = TimerHIIT();
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(icon: Icon(Icons.add_circle_outline)),
                onSubmitted: (text) {
                  setState(() {
                    var routine = Routine(
                        name: text,
                        secT: timerHIIT.secTraining,
                        minT: timerHIIT.minTraining,
                        secRest: timerHIIT.secRest,
                        minRest: timerHIIT.minRest,
                        secRound: timerHIIT.secRoundRest,
                        minRound: timerHIIT.minRoundRest,
                        sets: timerHIIT.sets,
                        exercise: timerHIIT.exercises);
                    print("Objeto: " + routine.name);
                    _routineHelper.insertRoutine(routine);
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }
}

/*_addRoutine() {
    //RoutineDatabase db = RoutineDatabase();
    TimerHIIT timerHIIT = TimerHIIT();
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(icon: Icon(Icons.add_circle_outline)),
                onSubmitted: (text) {
                  setState(() {
                    //var routine = Routine(text, timerHIIT, id: -1);
                    //db.insert(routine);
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }*/
