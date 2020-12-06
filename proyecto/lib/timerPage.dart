import 'dart:async';
import 'package:flutter/material.dart';
import 'time_card_list.dart';
import 'stringAndNumbers.dart';
import 'timerHIITclass.dart';

String secText, minText;  //Segundos y minutos para el widget Text
var seconds, minutes,actualColor; //Segundos y minutos que esta utilizando el temporizador actualmente


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
  var colorsQueue = List<int>();
  Timer currentTimer;
  TimerHIIT timerHIIT = new TimerHIIT();
  var icon = Icons.play_circle_fill;
  bool isTimerActive = false;

  //Rellena la cola de duraciones
  void startSets() {
    timerQueue.add(Duration(seconds: 10));
    colorsQueue.add(0);
    for (var i = 0; i < timerHIIT.sets; i++) {
      for (var j = 0; j < timerHIIT.exercises; j++) {
        timerQueue.add(Duration(seconds: timerHIIT.secTraining,minutes:timerHIIT.minTraining ));
        colorsQueue.add(1);
        timerQueue.add(Duration(seconds:timerHIIT.secRest ,minutes:timerHIIT.minRest ));
        colorsQueue.add(2);
      }
      if(timerHIIT.sets == i){
        timerQueue.add(Duration(seconds:timerHIIT.secRoundRest ,minutes: timerHIIT.minRoundRest ));
        colorsQueue.add(3);
      }
    }
    startNextTimer();
  }
  //Detiene el timer
  void stopTimer() {
    currentTimer.cancel();
    //currentTimer = null;
    timerQueue.insert(0,Duration(seconds: seconds,minutes: minutes));
    colorsQueue.insert(0, actualColor);
  }
  //Funcion recursiva para correr el reloj
  void startNextTimer() {
    if (timerQueue.isEmpty) {
      this.widget.changeState(0);
      isTimerActive = false;
      setState(() {
        icon = Icons.play_circle_fill;
      });
      return;
    }

    var duration = timerQueue.first;
    timerQueue.remove(timerQueue.first);
    seconds = duration.inSeconds % 60;
    minutes = duration.inMinutes;

    actualColor = colorsQueue.first;
    this.widget.changeState(colorsQueue.first);
    colorsQueue.remove(colorsQueue.first);

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
    return Stack(
        children: <Widget>[ //Uso stack, porque apilare cosas, una sobre la otra
          /*Align(
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
          ),*/
          Align(
            child: Container(
              child: minText != null ? Text( //Texto de numeros
                "$minText:$secText",
                style: TextStyle(
                    fontSize: 74,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff8f1f1)
                ),
              ):Text(
                "00:00",
                style: TextStyle(
                    fontSize: 74,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff8f1f1)
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(0, 120, 0, 30),  //Padding del temporizador
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 0, 200),  //Padding del icono
              child: IconButton( //Boton de reloj del centro
                icon: Icon(icon,
                  color: Color(0xfff8f1f1),
                ),
                iconSize: 115,
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
          ),
          Align(
            alignment: Alignment.center,
            child: TimeCardList(timerHIIT),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: RawMaterialButton(
              onPressed: stopTimer,
              elevation: 2.0,
              fillColor: Color(0xfff8f1f1),
              child: Icon(
                Icons.add,
                size: 35.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          )
        ]
    );
  }
}

