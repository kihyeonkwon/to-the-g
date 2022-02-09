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
  final myTextController = TextEditingController();
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('scores').doc();

  Stream<List> readScores() => FirebaseFirestore.instance
      .collection('scores')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  _uploadData() async {
    documentReference.set({
      'score': score,
      'created_at': Timestamp.now(),
      'message': myTextController.text,
      'effect': 0,
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('디지셨습니다.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
                TextField(controller: myTextController)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('데이터 보내기!'),
              onPressed: () {
                _uploadData();
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  myTextController.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void handleTapDown(e) {
    score = 0;
    _timer = Timer.periodic(Duration(milliseconds: 10), (t) {
      setState(() {
        score++;
      });
    });
  }

  void handleTapUp(e) {
    print("handle up");
    _showMyDialog();
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
            StreamBuilder(
                stream: readScores(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final scores = snapshot.data!;
                    print(scores);
                    return Text('djfkldf');
                  }
                  return Text('slkdfjkldkfjlk');
                })
          ],
        ),
      ),
    );
  }
}
