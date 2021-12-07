import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:to_the_g/screens/play.dart';

class Home extends StatelessWidget {
  static const String id = "/";
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.red);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/home_bg.png'),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('To the G'),
                      WavyAnimatedText('To the G'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.pushNamed(context, Play.id);
                    },
                    child: const Text('해볼까예?'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
