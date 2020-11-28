import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'timerPage.dart';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores
int secTraining = 15, minTraining = 0, secRest=15, minRest=0, sets=2, exercises = 2; // minutos, segundos, secundos de descanso y sets. Por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen
String secText, minText;
bool isTimerActive = false;
var seconds, minutes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FiTime',
        home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var timerQueue = List<Duration>();
  Timer currentTimer;

//Create the sets
  void startSets() {
    timerQueue.add(Duration(seconds: 10));
    for (var i = 0; i < sets; i++) {
      for (var j = 0; j < exercises; j++) {
        timerQueue.add(Duration(seconds: 15));
      }
      timerQueue.add(Duration(seconds: 12));
    }
    startNextTimer();
  }

  void stopTimer() {
    currentTimer.cancel();
    currentTimer = null;
    timerQueue.insert(0,Duration(seconds: seconds,minutes: minutes));
  }

  void startNextTimer() {
    if (timerQueue.isEmpty) {
      return;
    }

    var duration = timerQueue.first;
    timerQueue.remove(timerQueue.first);
    seconds = duration.inSeconds % 60;
    minutes = duration.inMinutes;

    currentTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0){
          seconds--;
        } else if (seconds == 0 && minutes > 0) {
          minutes--;
          seconds = 59;
        } else {
          currentTimer.cancel();
          currentTimer = null;
        }
        minText = minToString(minutes);
        secText = secToString(seconds);
        if (currentTimer == null) {
          startNextTimer();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    /*minText=minToString(minTraining);
    secText=secToString(secTraining);*/
    return Scaffold(
      body: Timer_Page(parameterFuction: chageState),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Mis temporizadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Temporizador',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Configuracion',
          ),
        ],
        selectedItemColor: Color(0xffec524b),

      ),
      backgroundColor: Color(backgroundColors[state]),  //El color se va cambiando dependiendo del state
    );
  }
}

/*Algoritmo que se encarga de cambiar colores de fondo*/
void chageState(){
  state++;
  if(state == 3)
    state = 0;
}

//Convierte el segundo de entero a String
String secToString(int seconds){
  String num = seconds.toString();
  if(seconds>9){
    return num;
  }else{
    return "0$num";
  }
}

//Convierte el minuto de entero a String
String minToString(int minutes){
  String num = minutes.toString();
  if(minutes>9){
    return num;
  }else{
    return "0$num";
  }
}
