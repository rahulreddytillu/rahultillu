import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validate/validate.dart';
import 'package:intl/intl.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new SignupPage(),
));

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignuppageState();
}

class _SignupData extends Contact {
  String name;
  String email;
  String password;
  String confirmation;
  String dob;

}
class Contact{
  String phone;
}
Contact newContact = new Contact();
var passKey = GlobalKey<FormFieldState>();

class _SignuppageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _SignupData _data = new _SignupData();

  String _validateEmail(String input) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(input);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }
    // ignore: unused_local_variable

    _data.email=input;
    return _data.email;
  }

//  String _validatepassword(String value) {
//    if (value.length < 8) {
//      return 'The Password must be at least 8 characters.';
//    }
//
//    return null;
//  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^[()\d -]{1,15}$');
    if(input.length != 10) {
      return regex.hasMatch(input ='Number must contain 10 digits');
    }
    _data.phone = input;
    return regex.hasMatch(_data.phone);
  }

  bool isValidname(String input) {
    final RegExp regex = new RegExp(r'^[a-zA-Z\ ]{1,35}$');
    _data.name = input;
    return regex.hasMatch(_data.name);
  }

  bool isValidDob(String input) {
    if (input.isEmpty)
    { print('Dob cannot be Empty');}
    var d = convertToDate(input);
    if (d != null && d.isBefore(new DateTime.now()))
    {
      _data.dob = d as String;
    }
    print (_data.dob);
  }



  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the SignUp data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
      print('Re-enter Password: ${_data.confirmation}');
    }
  }


  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1950 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1950),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  DateTime convertToDate(String dob) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(dob);
      return d;
    } catch (e) {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;



    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.green,
        title: new Text('Sign up'),
      ),
      body: new Container(

          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters:[
                      new WhitelistingTextInputFormatter(
                          new RegExp(r'^[a-zA-Z\ ]{1,35}$'))
                    ],
                    validator: (value) => isValidname(value)
                        ? null
                        : 'Username cannot be empty'
                ),
                new SizedBox(
                    height:12.0
                ),
                new Row(children: <Widget>[
                  new Expanded(
                      child: new TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Enter your Date Of Birth',
                          labelText: 'Date Of Birth',
                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                        ),
                        controller: _controller,
                        keyboardType: TextInputType.datetime,
                        validator: (dob) => isValidDob(dob) ? null : 'Not a Valid Date',
                      )),
                  new IconButton(
                    icon:new Icon(Icons.calendar_today),
                    tooltip: 'Choose Date',
                    onPressed: (() {
                      _chooseDate(context, _controller.text);

                    }),
                  )
                ]),
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Enter your Number',
                    labelText: 'Contact',
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    new WhitelistingTextInputFormatter(
                        new RegExp(r'^[()\d -]{1,15}$')),
                  ],
                  validator: (phone) => isValidPhoneNumber(phone)
                      ? null
                      : 'Number Must Contain 10 Digits',
                ),
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                    validator: this._validateEmail,
                    onSaved: (String email) {
                      this._data.email = email;
                    }
                ),
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                    key: passKey,
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your password',
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                    validator: (password1)
                    {
                      var result = password1.length < 8 ? "Password should contain atleast 8 characters"
                          : null;
                      _data.password = result;
                      return _data.password;
                    }
                ),
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: 'password',
                    labelText: 'Re-enter your password',
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  validator: (password2){
                    var password1 = passKey.currentState.value;
                    if (password2=password1){
                      _data.confirmation =password2;
                      return _data.confirmation;
                    }
                    return "Both passwords must be matched";
                  },
                ),
                new SizedBox(
                    height:12.0
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Sign up',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed:(){
                      if(_formKey.currentState.validate()){
//                        AlertDialog dialog = new AlertDialog(
//                              content: new Text('You have Registered Successfully Please Sign-In'));
//
                        Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
//                          showDialog(
//                              context: context, builder: (BuildContext context) => dialog);
                          return Container(
                            color: Colors.white,
                            child: new AlertDialog(
                                content: new Text(
                                    'You have Registered Successfully Please Sign-In')
                            ),
                          );
                        }
                        )
                        );
                      }
                    },
                    color: Colors.green,
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
