import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final function;
  bool switchPitido, switchInicio;
  SettingsPage({this.switchInicio,this.switchPitido,this.function});
  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width)/1.25,
              height: (MediaQuery.of(context).size.height)/11,
              decoration: BoxDecoration(
                color: Color(0xfff5b461),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0) //         <--- border radius her
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pitidos',
                    style: TextStyle(
                      color: Color(0xff16697a),
                      fontSize: 20,
                      fontWeight:  FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: this.widget.switchPitido,
                    onChanged: (value){
                      setState((){
                        this.widget.switchPitido=value;
                        this.widget.function(this.widget.switchPitido);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ),
            Text(''),
            Container(
              width: (MediaQuery.of(context).size.width)/1.25,
              height: (MediaQuery.of(context).size.height)/11,
              decoration: BoxDecoration(
                color: Color(0xfff5b461),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0) //         <--- border radius here
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Sonido de inicio',
                    style: TextStyle(
                      color: Color(0xff16697a),
                      fontSize: 20,
                      fontWeight:  FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: this.widget.switchInicio,
                    onChanged: (value){
                      setState(() {
                        this.widget.switchInicio=value;
                        if(this.widget.switchInicio == true){
                        }else{
                        }
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}