import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'stringAndNumbers.dart';

class TimeCard extends StatefulWidget {
  String title,secText,minText;
  IconData cardIcon;
  int sec, min;
  TimeCard(this.cardIcon,this.title,this.sec,this.min);

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Picker(
          adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
            const NumberPickerColumn(begin: 0, end: 5, ),
            const NumberPickerColumn(begin: 0, end: 59, jump: 1),
          ]),
          delimiter: <PickerDelimiter>[
            PickerDelimiter(
              child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: Text(":"),
              ),
            )
          ],
          hideHeader: true,
          confirmText: 'OK',
          confirmTextStyle: TextStyle(inherit: false, color: Color(0xffec524b), fontSize: 22),
          title: const Text('Seleccionar duración'),
          selectedTextStyle: TextStyle(color: Color(0xff16697a)),
          onConfirm: (Picker picker, List<int> value) {
            // You get your duration here
            Duration _duration = Duration(minutes: picker.getSelectedValues()[0], seconds: picker.getSelectedValues()[1]);
            setState(() {
              widget.sec = _duration.inSeconds % 60;
              widget.min = _duration.inMinutes;
              widget.secText = secToString(widget.sec);
              widget.minText = minToString(widget.min);
            });
          },
        ).showDialog(context);
      },
      color: Color(0xfff5b461),
      textColor: Color(0xff16697a),
      child:Container(
        width: (MediaQuery.of(context).size.width)/1.25,
        height: (MediaQuery.of(context).size.height)/13,
        child: Row(
          children: <Widget>[
            Container(
                child:Icon(widget.cardIcon,
                  size: 25,
                )
            ),
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
            Expanded(
              flex: -1 ,
                child: Container(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width)/11,
                      right: (MediaQuery.of(context).size.width)/12
                  ),
                  child: Text(
                    "${widget.minText}:${widget.secText}",
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