import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores
int secTraining = 15, minTraining = 0, secRest=15, minRest=0, sets=2, exercises = 2; // minutos, segundos, secundos de descanso y sets. Por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen
String secText, minText;

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
  Timer timer;

  //Funcion que genera los sets
  void startSets(){
    startTimer(10,0);
      for(int i=0; i<sets;i++){
        for(int j=0;j<exercises;j++){
          startTimer(secTraining,minTraining);
         // startTimer(secRest,minRest);
        }
       // startTimer(10,0);
      }
  }

  void stopTimer(){ //Detiene el reloj
    timer.cancel();
  }

  void startTimer(int seconds, int minutes) async{ //inicia la funcion de temporizacion
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(seconds>0){
          seconds--;
        }else if(seconds==0 && minutes>0){
          minutes--;
          seconds = 59;
        }else{
          timer.cancel();
        }
        minText=minToString(minutes);
        secText=secToString(seconds);
        print("$minutes:$seconds");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /*minText=minToString(minTraining);
    secText=secToString(secTraining);*/
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
                    startSets();
                    //chageState();

                  });},
              ),
            ),
            Align(
              child: Container(
                child:Text( //Texto de numeros
                  "$minText:$secText",
                  style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(110),
              ),

              alignment: Alignment.topCenter,
            ),
          ]
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
