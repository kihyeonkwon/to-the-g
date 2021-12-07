import 'package:flutter/material.dart';
import 'dart:async';

class Play extends StatefulWidget {
  static const String id = "/play";
  const Play({Key? key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  int score = 0;
  var _isPlaying = false;
  late Timer _timer;

  void handleTapDown(e) {
    score = 0;
    _timer = Timer.periodic(Duration(milliseconds: 10), (t) {
      setState(() {
        score++;
      });
    });
  }

  void handleTapUp(e) {
    print("hadle up");
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: Text('Your score is $score'))),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onPanDown: handleTapDown,
                    onPanEnd: handleTapUp,
                    child: Container(
                      color: Colors.grey,
                    )))
          ],
        ),
      ),
    );
  }
}
