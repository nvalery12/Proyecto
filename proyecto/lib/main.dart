import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'timerPage.dart';
import 'routinePage.dart';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2,0xff28df99]; //lista de colores, cada posicion es un color distinto
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
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {

    final tabs = [
      RoutinePage(),
      Timer_Page(changeState: chageState),
      Center(child: Text("Aqui va ajustes"),),
    ];

    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Mis temporizadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Temporizador',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Configuracion',
          ),
        ],
        selectedItemColor: Color(0xffec524b),
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
      backgroundColor: Color(backgroundColors[state]),  //El color se va cambiando dependiendo del state
    );
  }
}
