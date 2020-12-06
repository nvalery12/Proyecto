import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

//Funcion que se encarga de reproducir el audio
void sonido(String audio){
  final player = AudioCache();
  player.play('$audio.mp3');
}

//Si es verdaddero, en el timer debe ejecutar el audio para el inicio. caso contrario, no hara nada
bool isSwitchInicio(bool valor){
  if(valor == true){
    return true;
  }else{
    return false;
  }
}

//Si es verdaddero, en el timer debe ejecutar el audio para el pitidos. caso contrario, no hara nada
bool isSwitchPitido(bool valor){
  if(valor == true){
    return true;
  }else{
    return false;
  }
}

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
  String audio = 'inicio'; // --> Solo es de prueba, luego quitar
  bool switchPitido = false, switchInicio = false;

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
                          isSwitchPitido(switchPitido);
                          sonido(audio); // --> Solo es de prueba, luego quitar
                        }else{
                          isSwitchPitido(switchPitido);
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
                          isSwitchInicio(switchInicio);
                          sonido(audio); // --> Solo es de prueba, luego quitar
                        }else{
                          isSwitchInicio(switchInicio);
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