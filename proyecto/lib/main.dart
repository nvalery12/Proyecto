import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var backgroundColors = [0xffec524b,0xfff5b461,0xfff3eac2];
int state = 0;
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
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,  //Alineo el hijo al centro abajo
          child: Container(
            height: (MediaQuery.of(context).size.height)-300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        Center(
          child: IconButton(
              icon: Icon(Icons.access_alarm),
          onPressed: (){ //Cuando presiono
            setState(() { // Setea el estado
              state++;
              if(state == 3)
                state = 0;
            });
          },
        ),
          )
      ]
    ),
    backgroundColor: Color(backgroundColors[state]),
  );
  }

}



