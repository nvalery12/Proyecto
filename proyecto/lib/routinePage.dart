import 'package:flutter/material.dart';
import 'package:proyecto/database.dart';
import 'timerHIITclass.dart';

class RoutinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RoutinePage();
  }

}

class _RoutinePage extends State<RoutinePage>{
  RoutineDatabase db = RoutineDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fiTime'),
      ),
      body: FutureBuilder(
        future: db.initDB(),
        builder: (BuildContext context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return _ShowList(context);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoutine,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _ShowList(BuildContext context){
    return FutureBuilder(
      future: db.getAllRoutines(),
      initialData: List<Routine>(),
      builder: (BuildContext context, AsyncSnapshot<List<Routine>> snapshot){
        if(snapshot.hasData){
          return ListView(
            children: <Widget>[
              for (Routine routine in snapshot.data) ListTile(title: Text(routine.name),)
            ],
          );
        } else{
          return Center(
            child: Text('Agrega rutinas.'),
          );
        }
      },
    );
  }

  _addRoutine() {
    RoutineDatabase db = RoutineDatabase();
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
                      text,
                      timerHIIT,
                      id: -1
                    );
                    db.insert(routine);
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

}