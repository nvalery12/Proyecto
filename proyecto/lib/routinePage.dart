import 'package:flutter/material.dart';
import 'package:proyecto/database.dart';

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

  _addRoutine(){

  }
}