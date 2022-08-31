import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomKey(color: Colors.red, text: "C",note:"1",), CustomKey(color: Colors.blue, text: "C",note:"2",), CustomKey(color: Colors.green, text: "C",note:"2",), CustomKey(color: Colors.indigo, text: "C",note:"3",), CustomKey(color: Colors.yellow, text: "C",note:"4",), CustomKey(color: Colors.orange, text: "C",note:"5",), CustomKey(color: Colors.purple, text: "C",note:"2",), CustomKey(color: Colors.black, text: "C",note:"1",),
        ]),
      ),
    );
  }
}

class CustomKey extends StatelessWidget {
  const CustomKey({
    required this.color,
    required this.text,
    required this.note,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String text;
  final String note;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Play a sound as a one-shot, releasing its resources when it finishes playing.
          Audio.load('audio/note${note}.wav')
            ..play()
            ..dispose();
        },
        child: Container(
          child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          decoration: BoxDecoration(color: color),
        ),
      ),
    );
  }
}