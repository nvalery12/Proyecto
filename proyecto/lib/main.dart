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
    body: Center(
      child: IconButton(
        icon: Icon(Icons.access_alarm),
        onPressed: (){
          setState(() {
            state++;
            if(state == 3)
              state = 0;
          });
        },
      ),
    ),
    backgroundColor: Color(backgroundColors[state]),
  );
  }

}



