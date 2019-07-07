import 'package:flutter/material.dart';
import 'login.dart';
import 'homescreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROBIC RUFARM',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/login':(context)=>LoginScreen(),

      },
    );
  }
}
