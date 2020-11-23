import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  String title, time;
  IconData cardIcon;

  TimeCard(this.cardIcon,this.title,this.time);


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: Color(0xfff5b461),
      textColor: Color(0xff16697a),
      child:Container(
        width: (MediaQuery.of(context).size.width)/1.25,
        height: (MediaQuery.of(context).size.height)/11,
        child: Row(
          children: <Widget>[
            Icon(cardIcon,
              size: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width)/20,
                  right: (MediaQuery.of(context).size.width)/7
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width)/10,
                right: (MediaQuery.of(context).size.width)/12
              ),
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),
            ),
          )
        ]
      )
     )
    );
  }
}