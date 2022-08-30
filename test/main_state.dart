import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter 助手",
        ),
      ),
      body: const StateContent(),
    ));
  }
}

class StateContent extends StatefulWidget {
  const StateContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateContentState();
  }
}

class _StateContentState extends State<StateContent> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.lightBlueAccent,
      child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("点击次数$_counter !"),
            ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                },
                child: const Text("ADD_1"))
          ]),
    );
  }
}
