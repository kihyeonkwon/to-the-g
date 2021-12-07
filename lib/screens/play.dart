import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  static const String id = "/play";
  const Play({Key? key}) : super(key: key);

  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Play'),
    );
  }
}
