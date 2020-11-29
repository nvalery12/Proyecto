import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';


class TimeCard extends StatelessWidget {
  String title, time;
  IconData cardIcon;

  TimeCard(this.cardIcon,this.title,this.time);


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Picker(
          adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
            const NumberPickerColumn(begin: 0, end: 999, suffix: Text(' hours')),
            const NumberPickerColumn(begin: 0, end: 60, suffix: Text(' minutes'), jump: 15),
          ]),
          delimiter: <PickerDelimiter>[
            PickerDelimiter(
              child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ),
            )
          ],
          hideHeader: true,
          confirmText: 'OK',
          confirmTextStyle: TextStyle(inherit: false, color: Colors.red, fontSize: 22),
          title: const Text('Select duration'),
          selectedTextStyle: TextStyle(color: Colors.blue),
          onConfirm: (Picker picker, List<int> value) {
            // You get your duration here
            Duration _duration = Duration(hours: picker.getSelectedValues()[0], minutes: picker.getSelectedValues()[1]);
          },
        ).showDialog(context);
      },
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