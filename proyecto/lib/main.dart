import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'timerPage.dart';

var backgroundColors = [0xffec524b,0xff28df99,0xff3f52e3,0xfff5d97e]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores

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

  /*Algoritmo que se encarga de cambiar colores de fondo*/
  chageState(int newState){
    setState(() {
      state = newState;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Timer_Page(changeState: chageState,),
      backgroundColor: Color(backgroundColors[state]),  //El color se va cambiando dependiendo del state
    );
  }
}
