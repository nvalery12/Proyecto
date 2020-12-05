import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'stringAndNumbers.dart';

class RepetitionCard extends StatefulWidget {
  String title;
  IconData cardIcon;
  int repetition;
  final function;
  RepetitionCard(this.cardIcon,this.title,this.repetition,this.function);

  @override
  _RepetitionCardState createState() => _RepetitionCardState();
}

class _RepetitionCardState extends State<RepetitionCard> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Picker(
            adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
              const NumberPickerColumn(begin: 0, end: 30,),
            ]),
            hideHeader: true,
            confirmText: 'OK',
            confirmTextStyle: TextStyle(inherit: false, color: Color(0xffec524b), fontSize: 22),
            title: const Text('Select '),
            selectedTextStyle: TextStyle(color: Color(0xff16697a)),
            onConfirm: (Picker picker, List<int> value) {
              setState(() {
                if((widget.repetition > 2) && (widget.title == "Ejercicios")){
                  widget.repetition= picker.getSelectedValues()[0];
                  widget.function(widget.repetition);
                }else if((widget.repetition > 0) && (widget.title == "Rondas")){
                  widget.repetition= picker.getSelectedValues()[0];
                  widget.function(widget.repetition);
                }else{
                  final scaffold = Scaffold.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: const Text('Valor invalido!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }

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
                        child:Text(
                          "${widget.repetition}X",
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