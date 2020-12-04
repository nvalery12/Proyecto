import 'package:flutter/material.dart';
import 'package:proyecto/database.dart';

class RoutineCard extends StatefulWidget {
  String title;
  RoutineCard(this.title);
  @override
  _RoutineCardState createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
        },
        color: Color(0xfff5b461),
        textColor: Color(0xff16697a),
        child:Container(
            width: (MediaQuery.of(context).size.width)/1.25,
            height: (MediaQuery.of(context).size.height)/13,
            child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:Container(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}