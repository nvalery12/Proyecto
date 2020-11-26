import 'package:flutter/material.dart';
import 'time_card_list.dart';


class Timer_Page extends StatefulWidget{
  final parameterFuction;
  const Timer_Page({Key key,@required this.parameterFuction}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Timer_Page();
  }
}

class _Timer_Page extends State<Timer_Page>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
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
          Align(
            child: Container(
              child: Text( //Texto de numeros
                "00:00",
                style: TextStyle(
                    fontSize: 74,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(100),
            ),
          ),
          Center(
            child: IconButton( //Boton de reloj del centro
              icon: Icon(Icons.play_circle_fill,
                color: Color(0xffec524b),
              ),
              iconSize: 125,
                onPressed: (){ //Cuando presiono
                    this.widget.parameterFuction();
                    },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TimeCardList(),
          )
        ]
    );
  }
}