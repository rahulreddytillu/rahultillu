import 'package:flutter/material.dart';

import 'dashboard.dart';


class DevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DevicePageState();
}

class _Devicedata {
  String id = '';
}

class _DevicePageState extends State<DevicePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _Devicedata _data = new _Devicedata();

//  String _validateId(String value) {
//    // If empty value, the isEmail function throw a error.
//    // So I changed this function with try and catch.
//    try {
//      if(value.length!=6){
//        print('Id must contain 6 Digits');
//      }
//    } catch (e) {
//      return 'ID must be a Valid ID.';
//    }
//
//    return null;
//  }



  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the Device data.');
      print('ID: ${_data.id}');
    }
  }

  @override
  Widget build(BuildContext context) {
//    final Size screenSize = MediaQuery
//        .of(context)
//        .size;

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.green,
        title: new Text('Device Login'),
      ),
      body: new Container(
          padding: new EdgeInsets.fromLTRB(20,0,20,0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new Container(
                  height:320.0,
                  width:420.0,

                ),
                new TextFormField(
                    keyboardType: TextInputType.number,
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                      hintText: 'Enter your ID',
                      labelText: 'Device ID',
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                    validator: (value) {
                     var _id = value.length != 6 ? "ID must contain 6 digits"
                          : null;
                      return _id;
                    },
                    onFieldSubmitted : (String value) {
                      this._data.id = value;
                    }
                ),
                new Container(
                  //width: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(80,5,80,0),
                    child: new RaisedButton(
                      child: new Text(
                        'Go',

                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: () {
                         if(_formKey.currentState.validate()){
                         Navigator.of(context).push(
                           MaterialPageRoute<Null>(
                           builder: (BuildContext context) {
                           return new Dashboard();
                             }
                           )
                          );
                        }
                      },
                      color: Colors.green,
                    ),
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

