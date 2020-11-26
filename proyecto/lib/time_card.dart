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
            Container(
                child:Icon(cardIcon,
                  size: 25,
                )
            ),
            Expanded(
              flex: 1,
                child:Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
            Expanded(
              flex: -1 ,
                child: Container(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width)/11,
                      right: (MediaQuery.of(context).size.width)/12
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),

        ]
      )
     )
    );
  }
}