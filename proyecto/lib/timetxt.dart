import 'dart:math';

import 'package:flutter/material.dart';

class Timetxt extends StatefulWidget{

  Timetxt ({ Key key, this.min, this.sec }): super(key: key);

  int min;
  int sec;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Timetxt();
  }
  void lessTime(){
    _Timetxt().lessTime;
  }

}


class _Timetxt extends State<Timetxt>{
  void lessTime(){
    setState(() {
      widget.min--;
      widget.sec--;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: Container(
        child: Text(
          "${widget.min} : ${widget.sec}",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        alignment: Alignment.topCenter,
        ),
      alignment: Alignment.topCenter,
    );

  }

}

