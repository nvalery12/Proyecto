import 'dart:async';

import 'package:flutter/material.dart';
import 'time_card_list.dart';

int secTraining = 15, minTraining = 0, secRest=15, minRest=0, sets=2, exercises = 2; // minutos, segundos, secundos de descanso y sets. Por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen
String secText, minText;
var seconds, minutes;


class Timer_Page extends StatefulWidget{
  final changeState;
  const Timer_Page({Key key, this.changeState}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Timer_Page();
  }
}

class _Timer_Page extends State<Timer_Page>{
  bool isTimerActive = false;
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
    // TODO: implement build
    return Stack(
        children: <Widget>[ //Uso stack, porque apilare cosas, una sobre la otra
          Align(
            alignment: Alignment.bottomCenter,  //Alineo el hijo al centro abajo
            child: Container(  //Rectangulo cuadrado blanco
              height: (MediaQuery.of(context).size.height)-300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( // redondea solo...
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              child: Text( //Texto de numeros
                "00:00",
                style: TextStyle(
                    fontSize: 74,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(100),
            ),
          ),
          Center(
            child: IconButton( //Boton de reloj del centro
              icon: Icon(Icons.play_circle_fill,
                color: Color(0xffec524b),
              ),
              iconSize: 125,
                onPressed: (){ //Cuando presiono
                  if(isTimerActive == false){
                    isTimerActive = true;
                    if(timerQueue.isEmpty){
                      startSets();
                    }else{
                      startNextTimer();
                    }
                  }else{
                    isTimerActive = false;
                    stopTimer();
                  }
                },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TimeCardList(),
          )
        ]
    );
  }
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
