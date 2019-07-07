import 'package:flutter/material.dart';

import 'devicelogin.dart';
class Adddevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery
        .of(context)
        .size
        .height
        .toString());
    final title = 'Add Devices';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: new AppBar(
            backgroundColor: Colors.green,
            title: new Text('CAMARON', style: TextStyle(color: Colors.white),
              textAlign: TextAlign.end,),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Navigation menu',
                onPressed: () =>
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
    return new Adddevices();

    }
    ),
    ),
            ),

//            actions: <Widget>[
//              new IconButton(
//                  icon: new Icon(Icons.question_answer),
//                  onPressed: () { Navigator.of(context).push(
//                    MaterialPageRoute<Null>(builder: (BuildContext context) {
//                      //return new Faqs();
//                    }),
//                  );
//                  }),
//            ],),
          ),

          body: new GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (detail) {
                print(detail);
//FocusScope.of.requestFocus(new FocusNode());
              },
              child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new SizedBox(height: 5.0),
                    new Container(
                      height: 60.0,
                      color: Colors.white,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.mobile_screen_share,
                              color: Colors.green, size: 30.0),
                          new Padding(
                              padding: const EdgeInsets.only(right: 5.0)),
                          new Text('My Devices',
                              style:
                              new TextStyle(
                                  color: Colors.green, fontSize: 23.0)),
                        ],
                      ),
                    ),
                    new SizedBox(height: 0.0),
//                    new Container(
//                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 35),
//                      color: Colors.blueGrey,
//                      width: 350.0,
//                      height: 200.0,
//                      child: Text('GRAPH', style: new TextStyle(
//                          color: Colors.white, fontSize: 60),),
//
//                      alignment: Alignment.center,),

                    Row(

                        children: <Widget>[


                          // Column(
                          // children: <Widget>[
//                          new Container(
//                            margin: EdgeInsets.all(45),
//                            color: Colors.green[300],
//                            width: 125.0,
//                            height: 125.0,
//                           child: Row(
//                             children: <Widget>[
//                               Flexible(
//
//                                 flex: 2,
//                                   child: Text(
//                                         'My Devices',
//                             textAlign: TextAlign.right,
//                             style: TextStyle(fontSize: 20.0),
//                                   ),)
//              ]
//                                                              )
//                                                      )



                    new Container(
                    margin: new EdgeInsets.all(10.0),
              child: new Padding(
                  padding: new EdgeInsets.all(30.0),
                  child: new SizedBox(
                    height: 70,
                    width: 70,
                  child: IconButton(
                      icon: Icon(Icons.add_circle),
                      color:Colors.green,
                      alignment: Alignment.center,
                      iconSize: 100,
                      tooltip:'Add device',

                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                                  return new DevicePage();
                                }
                            )
                        );
                      }
              )
                    )


                                             )
                    )

          ]
          ),
            ]
    )
    )
    )
    );
  }

}
                             //decoration: InputDecoration(
                               //contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                               //border: InputBorder.none,
                               //prefixIcon: Padding(
                                 //padding: EdgeInsets.all(0.0),
//                                 child: Icon(
//                                   Icons.search,
//                                   color: Colors.grey,
//                                 ), // icon is 48px widget.
//                               ),
//            ]
//                               ),
//                               )
//          ]
//                               )
//                             ],
//                           )
                           // new Icon(Icons.add_circle_outline),
                            //decoration: new BoxDecoration(color: Colors.yellow,),
//                            child: new Text(
//                              'Add Device', style: new TextStyle(fontSize: 40),
//                              textAlign: TextAlign.center,),
                       //   ),
                          //  Expanded(
                          //  child: new Text('Value'),
                          // )
                          //    ],
                          //),


                          // color: Colors.greenAccent,
                          // decoration: new BoxDecoration(color: Colors.yellow,),


//                          new Container(
//                            margin: EdgeInsets.all(30),
//                            color: Colors.lightBlueAccent[100],
//                            width: 125.0,
//                            height: 125.0,
//
//                            child: new Text(
//                              'DO', style: new TextStyle(fontSize: 40),
//                              textAlign: TextAlign.center,),
//
//                          ),
//                        ],
//                          ),
//
//
//                    // children: <Widget>[
//
//
////                    Padding(
////                      padding: const EdgeInsets.fromLTRB(80, 0, 100, 0),
////                      child: new Container(
////
////                        margin: EdgeInsets.all(20),
////                        color: Colors.blueGrey[50],
////                        width: 125.0,
////                        height: 125.0,
////
////                        child: new Text(
////                          'Temp', style: new TextStyle(fontSize: 40),
////                          textAlign: TextAlign.center,),
////
////                        // color: Colors.greenAccent,
////                        //      decoration: new BoxDecoration(color: Colors.yellow),
////                      ),
////                    ),
////
////
////                    //]),
////
////                    Padding(
////                      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
////                      child: new Container(
////                        child: new RaisedButton(
////                          child: new Text('CALIBERATE',
////                            style: new TextStyle(color: Colors.white),
////                            textAlign: TextAlign.center,
////                          ),
////                          onPressed: (){
////
////
////                          },
////                          color: Colors.blueAccent,
////
////                        ), //raised button method
////                      ), //raised button container
////                    ), //padding method
//////                    RaisedButton(
//////                        child: Text('Create Record'),
//////                        onPressed: () {
//////                          getData();
//////                          //createRecord();
//////                        }
//////                    ),
////                    //end of widget
////
////
////                  ]
////              ) //end of list View
////          ) //end of gesture Detector
////      ), //end of Scaffold
////    ); //end of MaterialApp
////  } //end of main method
////}