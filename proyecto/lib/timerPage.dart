import 'dart:async';

import 'package:flutter/material.dart';
import 'time_card_list.dart';

int secTraining = 15, minTraining = 0, secRest=15, minRest=0, secRoundRest = 10, minRoundRest = 0, sets=2, exercises = 2; //Valores para el circuito
String secText, minText;  //Segundos y minutos para el widget Text
var seconds, minutes; //Segundos y minutos que esta utilizando el temporizador actualmente


class Timer_Page extends StatefulWidget{
  final changeState; //Funcion pasada por parametro
  const Timer_Page({Key key, this.changeState}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Timer_Page();
  }
}

class _Timer_Page extends State<Timer_Page>{
  var timerQueue = List<Duration>();
  Timer currentTimer;

  //Rellena la cola de duraciones
  void startSets() {
    timerQueue.add(Duration(seconds: 10));
    for (var i = 0; i < sets; i++) {
      for (var j = 0; j < exercises; j++) {
        timerQueue.add(Duration(seconds: secTraining,minutes:minTraining ));
        timerQueue.add(Duration(seconds:secRest ,minutes:minRest ));
      }
      timerQueue.add(Duration(seconds:secRoundRest ,minutes: minRoundRest ));
    }
    startNextTimer();
  }
  //Detiene el timer
  void stopTimer() {
    currentTimer.cancel();
    currentTimer = null;
    timerQueue.insert(0,Duration(seconds: seconds,minutes: minutes));
  }
  //Funcion recursiva para correr el reloj
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

  bool isTimerActive = false;
  @override
  Widget build(BuildContext context) {
    var icon = Icons.play_circle_fill;
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
                "$minText:$secText",
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
              icon: Icon(icon,
                color: Color(0xffec524b),
              ),
              iconSize: 125,
                onPressed: (){ //Cuando presiono
                  if(isTimerActive == false){
                    isTimerActive = true;
                    if(timerQueue.isEmpty){
                      startSets(); //Relleno la cola de duraciones
                    }else{
                      startNextTimer(); // Inicia el reloj con las duraciones que quedaron pendientes
                    }
                    setState(() {
                      icon = Icons.pause_circle_filled;
                    });
                  }else{
                    isTimerActive = false;
                    stopTimer();
                    setState(() {
                      icon = Icons.play_circle_fill;
                    });
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
