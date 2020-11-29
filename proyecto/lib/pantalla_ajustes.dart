import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // we need this for the vibrations
import 'dart:io'; // we need this for the sleep method
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:vibration/vibration.dart';

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
  final player = AudioCache();
  bool switchPitido = false, switchVibrar = false, switchInicio = false;

  //Funcion que hace la vibracion, investigar de vibrate.dart para borrarlo luego
  _PatternVibrate() {
    Vibration.vibrate(duration: 5000);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FiTime'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(''),
            Container(
              width: (MediaQuery.of(context).size.width)/1.25,
              height: (MediaQuery.of(context).size.height)/11,
              decoration: BoxDecoration(
                color: Color(0xfff5b461),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0) //         <--- border radius her
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Pitidos',
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
            ),
            Text(''),
            Container(
              width: (MediaQuery.of(context).size.width)/1.25,
              height: (MediaQuery.of(context).size.height)/11,
              decoration: BoxDecoration(
                color: Color(0xfff5b461),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0) //         <--- border radius here
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Vibrar",
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

                          // La que no funciona fijate del terminal
                          Vibration.vibrate();

                          //el que si funciona
                          _PatternVibrate();
                        }
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ),
            Text(''),
            Container(
              width: (MediaQuery.of(context).size.width)/1.25,
              height: (MediaQuery.of(context).size.height)/11,
              decoration: BoxDecoration(
                color: Color(0xfff5b461),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0) //         <--- border radius here
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Sonido de inicio',
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
            ),
          ],
        ),
      ),
    );
  }
}