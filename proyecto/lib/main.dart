import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores
int min = 5, sec = 5; // minutos y segundos, por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen

/*Algoritmo que se encarga de cambiar colores de fondo*/
void chageState(){
  state++;
  if(state == 3)
    state = 0;
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cronometro',
        home: MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sec = 10, min = 2;
  Timer timer;
  String ssec, smin;

  String segundo(){ //Convierte el segundo de entero a String
    String num = sec.toString();
    if(sec>9){
      return num;
    }else{
      return '0$num';
    }
  }

  String minuto(){ //Convierte el minuto de entero a String
    String num = min.toString();
    if(min>9){
      return num;
    }else{
      return '0$num';
    }
  }

  void detener(){ //Detiene el reloj
    timer.cancel();
  }

  void startTimer(){ //inicia la funcion de temporizacion
    sec = 10;
    min = 2;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(sec>0){
          sec--;
        }else if(sec==0 && min>0){
          min--;
          sec = 59;
        }else{
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    smin=minuto(); ssec=segundo();
    return Scaffold(
      body: Stack(
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
            Center(
              child: IconButton( //Boton de reloj del centro
                icon: Icon(Icons.access_alarm),
                onPressed: (){ //Cuando presiono
                  setState(() { //Setea el estado, es decir, revisa las variables
                    startTimer();
                    chageState();
                  });},
              ),
            ),
            Align(
              child: Container(
                child: Text( //Texto de numeros
                  "$smin:$ssec",
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(110),
              ),
              alignment: Alignment.topCenter,
            )
          ]
      ),
      backgroundColor: Color(backgroundColors[state]),  //El color se va cambiando dependiendo del state
    );
  }
}