import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    _uploadData() async {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('scores').doc();
      documentReference.set({'score': 6767867});
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$score',
                      style: TextStyle(fontFamily: 'VT323'),
                    ))),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onPanDown: handleTapDown,
                    onPanEnd: handleTapUp,
                    child: Container(
                      color: Colors.grey,
                    ))),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    _uploadData();
                  },
                  child: Text('upload data')),
            )
          ],
        ),
      ),
    );
  }
}
