import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

var blue = Color(0xFF1E1F30);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morkode',
      home: MorseCodeFlash(),
      theme: ThemeData(
        scaffoldBackgroundColor: blue,
      ),
    );
  }
}

class MorseCodeFlash extends StatefulWidget {
  MorseCodeFlash({Key key}) : super(key: key);

  @override
  State createState() => ChatWindow();
}

class ChatWindow extends State<MorseCodeFlash> {
  final TextEditingController controller = TextEditingController();
  var animateState = "Idle";
  var percent = 0.0;
  var font = 'Tschichold';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                child: FlareActor(
                  "assets/logo.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animateState,
                )),
            Text("A morse code generator",
                style: TextStyle(
                    color: Colors.white30, fontFamily: font, fontSize: 25)),
            Expanded(
              child: Container(
                  child: FlareActor(
                "assets/transmit.flr",
                fit: BoxFit.contain,
                animation: animateState,
              )),
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              animateFromLastPercent: true,
              width: 300.0,
              animation: true,
              animationDuration: 400,
              lineHeight: 20.0,
              percent: (percent * 100).truncateToDouble() / 100,
              linearStrokeCap: LinearStrokeCap.round,
              progressColor: Color(0xFF22C9F9),
              backgroundColor: blue,
            ),
            Container(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: txtInput(),
            ))
          ],
        ),
      ),
    )));
  }

  Widget txtInput() {
    return Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color(0xFF10111A),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextField(
            controller: controller,
            onSubmitted: submitMsg,
            style:
                TextStyle(color: Colors.white, fontSize: 40, fontFamily: font),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white30, fontFamily: font),
              hintText: 'Enter Message',
            ),
          ),
        ));
  }

  void submitMsg(String txt) async {
    var chars = txt.trim().toLowerCase().split('');
    var counter = 0;
    var counter2 = 0;
    var counter3 = 0;
    var message = [];
    setState(() {
      animateState = "Play";
    });
    while (counter2 < chars.length) {
      message.add(morse[chars[counter2]]);
      counter2 += 1;
    }
    while (counter3 < message.length) {
      setState(() {
        percent += 1 / message.length;
      });
      while (counter < message[counter3].length) {
        if (message[counter3][counter] != 7) {
          await Lamp.flash(
              Duration(milliseconds: message[counter3][counter] * 100));
          await pause(Duration(milliseconds: 100));
        } else {
          await pause(Duration(milliseconds: 700));
        }
        counter += 1;
      }
      counter3 += 1;
      counter = 0;
      await pause(Duration(milliseconds: 300));
    }
    if (counter3 == message.length) {
      controller.clear();
      setState(() {
        animateState = "Done";
        percent = 0;
      });
    }
  }

  Future pause(Duration d) => Future.delayed(d);
}

Map<String, List> morse = {
  "a": [1, 3],
  "b": [3, 1, 1, 1],
  "c": [3, 1, 3, 1],
  "d": [3, 1, 1],
  "e": [1],
  "f": [1, 1, 3, 1],
  "g": [3, 3, 1],
  "h": [1, 1, 1, 1],
  "i": [1, 1],
  "j": [1, 3, 3, 3],
  "k": [3, 1, 3],
  "l": [1, 3, 1, 1],
  "m": [3, 3],
  "n": [3, 1],
  "o": [3, 3, 3],
  "p": [1, 3, 3, 1],
  "q": [3, 3, 1, 3],
  "r": [1, 3, 1],
  "s": [1, 1, 1],
  "t": [3],
  "u": [1, 1, 3],
  "v": [1, 1, 1, 3],
  "w": [1, 3, 3],
  "x": [3, 1, 1, 3],
  "y": [3, 1, 3, 3],
  "z": [3, 3, 1, 1],
  ".,": [1, 3, 1, 3, 1, 3],
  " ": [7],
  "0": [3, 3, 3, 3, 3],
  "1": [1, 3, 3, 3, 3],
  "2": [1, 1, 3, 3, 3],
  "3": [1, 1, 1, 3, 3],
  "4": [1, 1, 1, 1, 3],
  "5": [1, 1, 1, 1, 1],
  "6": [3, 1, 1, 1, 1],
  "7": [3, 3, 1, 1, 1],
  "8": [3, 3, 3, 1, 1],
  "9": [3, 3, 3, 3, 1]
};
