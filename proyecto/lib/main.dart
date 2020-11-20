import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2]; //lista de colores, cada posicion es un color distinto
int state = 0; //Sirve para llevar un control de la lista de colores
int min = 5, sec = 5; // minutos y segundos, por ahora esta inicializado, pero cuando este listo se le guardaran los valores que se le pasen

/*Pequeño algoritmo que se encarga del tiempo*/
void chageTime(){
  if(sec == 0){
    sec = 60;
    min--;
  }
  sec--;
}

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
        title: 'Flutter Demo',
        home: MyHomePage()
    );
  }
}
  class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
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
                    chageTime();
                    chageState();
                  });},
        ),
          ),
        Align(
          child: Container(
            child: Text( //Texto de numeros
              "$min:$sec", 
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



