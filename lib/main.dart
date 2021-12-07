import 'package:flutter/material.dart';
import 'package:to_the_g/screens/home.dart';
import 'package:to_the_g/screens/play.dart';
import 'package:to_the_g/screens/end.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', initialRoute: Home.id, routes: {
      Home.id: (context) => Home(),
      Play.id: (context) => Play(),
      End.id: (context) => End(),
    });
  }
}
