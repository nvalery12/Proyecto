import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // we need this for the vibrations
import 'dart:io'; // we need this for the sleep method
import 'dart:async';
import 'timerPage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores
int min = 5, sec = 5; // minutos y segundos, por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen

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
  bool valor = false;
  final player = AudioCache();
  bool switchPitido = false, switchVibrar = false, switchInicio = false, switchBloqueo = false;

  _PatternVibrate() {
    HapticFeedback.vibrate();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.heavyImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.heavyImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.vibrate();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.heavyImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.heavyImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.heavyImpact();
    HapticFeedback.vibrate();
    HapticFeedback.vibrate();
  }

  /*Algoritmo que se encarga de cambiar colores de fondo*/
  chageState(){
    setState(() {
      state++;
      if(state == 3)
        state = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('FiTime'),
      ),
      body: AbsorbPointer(
        absorbing: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
<<<<<<< HEAD
                width: (MediaQuery.of(context).size.width)/1.25,
                height: (MediaQuery.of(context).size.height)/11,
=======
>>>>>>> Ajustes
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfff5b461),
                  border: Border(
                  left: BorderSide(
                  color: Color(0xfff5b461),
                  width: 3,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Pitidos',
                      style: TextStyle(
                        color: Color(0xff16697a),
                        fontSize: 20,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: switchPitido,
                      onChanged: (value){
                        setState(() {
                          switchPitido=value;
                          print(switchPitido);
                          if(switchPitido == true){
                            player.play('note1.wav');
                          }
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
<<<<<<< HEAD
=======
                height: 50,
>>>>>>> Ajustes
              ),
              Text(''),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "   Vibrar                                      ",
                      style: TextStyle(
                        color: Color(0xff16697a),
                        fontSize: 20,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: switchVibrar,
                      onChanged: (value){
                        setState(() {
                          switchVibrar=value;
                          print(switchVibrar);
                          if(switchVibrar == true){
                            _PatternVibrate();
                          }
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                color: Color(0xfff5b461),
              ),
              Text(''),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '   Sonido de inicio                    ',
                      //Color(0xff16697a),
                      style: TextStyle(
                        color: Color(0xff16697a),
                        fontSize: 20,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: switchInicio,
                      onChanged: (value){
                        setState(() {
                          switchInicio=value;
                          print(switchInicio);
                          if(switchInicio == true){
                            player.play('note1.wav');
                          }
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                color: Color(0xfff5b461),
              ),
              Text(''),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '   Bloqueo de pantalla             ',
                      style: TextStyle(
                        color: Color(0xff16697a),
                        fontSize: 20,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: switchBloqueo,
                      onChanged: (value){
                        setState(() {
                          switchBloqueo=value;
                          print(switchBloqueo);
                          if(switchBloqueo == true){
                            absorbing: true;
                          }else{
                            absorbing: false;
                          }
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                color: Color(0xfff5b461),
              ),
            ],
          ),
        ),
      ),
    );
  }
}