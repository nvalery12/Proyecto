import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'time_card_list.dart';
import 'stringAndNumbers.dart';
import 'timerHIITclass.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

String secText, minText;  //Segundos y minutos para el widget Text
var seconds, minutes,actualColor; //Segundos y minutos que esta utilizando el temporizador actualmente
int soundIndex = 6;

const sounds = [
  'pitido.wav',
  'pitido2.wav',
];

class Timer_Page extends StatefulWidget{
  final changeState; //Funcion pasada por parametro
  Timer_Page({Key key, this.changeState,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Timer_Page();
  }
}

class _Timer_Page extends State<Timer_Page>{
  var timerQueue = List<Duration>();
  var colorsQueue = List<int>();
  var soundsQueue = Queue<int>();
  Timer currentTimer;
  TimerHIIT timerHIIT = new TimerHIIT();
  var icon = Icons.play_circle_fill;
  bool isTimerActive = false;

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play(sounds[soundIndex]);
  }
  //Rellena la cola de duraciones
  void startSets() {
    if(((timerHIIT.secTraining == 0) && (timerHIIT.minTraining == 0)) || ((timerHIIT.secRest == 0) && (timerHIIT.minRest == 0)) || ((timerHIIT.secRoundRest == 0) && (timerHIIT.minRoundRest == 0)) || (timerHIIT.sets == 0) || (timerHIIT.exercises == 0)){
      final scaffold = Scaffold.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Ingrese valores!'),
        ),
      );
      isTimerActive = false;
      setState(() {
        icon = Icons.play_circle_fill;
      });
      return;
    }
    timerQueue.add(Duration(seconds: 10));
    colorsQueue.add(0);
    soundsQueue.add(0);
    for (var i = 0; i < timerHIIT.sets; i++) {
      for (var j = 0; j < timerHIIT.exercises; j++) {
        timerQueue.add(Duration(seconds: timerHIIT.secTraining,minutes:timerHIIT.minTraining ));
        colorsQueue.add(1);
        soundsQueue.add(1);
        timerQueue.add(Duration(seconds:timerHIIT.secRest ,minutes:timerHIIT.minRest ));
        colorsQueue.add(2);
        soundsQueue.add(0);
      }
      if(timerHIIT.sets > i){
        timerQueue.add(Duration(seconds:timerHIIT.secRoundRest ,minutes: timerHIIT.minRoundRest ));
        colorsQueue.add(3);
        soundsQueue.add(1);
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
          soundIndex = soundsQueue.removeFirst();
          playLocalAsset();
          startNextTimer();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
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
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height)*0.1
              ),  //Padding del temporizador
            ),
          ),
          Align(
            alignment: Alignment.center,
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
                        if(isTimerActive == true)
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
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height)*0.04,
                bottom: (MediaQuery.of(context).size.height)*0.01
              ),
              child: TimeCardList(timerHIIT),
            ),
          ),
        ]
    );
  }
}

