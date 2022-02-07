import 'package:flutter/material.dart';
import 'package:to_the_g/screens/home.dart';
import 'package:to_the_g/screens/play.dart';
import 'package:to_the_g/screens/end.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBpdVXvwxZhemV3LFNS566Y_YXot-g0w1c",
          authDomain: "to-the-g.firebaseapp.com",
          projectId: "to-the-g",
          storageBucket: "to-the-g.appspot.com",
          messagingSenderId: "734713364710",
          appId: "1:734713364710:web:0c84807d872ae7cb843b27",
          measurementId: "G-H51YEND176"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: Home.id,
        theme: ThemeData(fontFamily: 'VT323'),
        routes: {
          Home.id: (context) => Home(),
          Play.id: (context) => Play(),
          End.id: (context) => End(),
        });
  }
}
