import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
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
      body: const ButtonWin(),
    ));
  }
}

class ButtonWin extends StatelessWidget {
  const ButtonWin({Key? key}) : super(key: key); //name为通道名要保证两端通道名称相等

  final testChannel = const MethodChannel("cbox");

  Future<String> test() async {
    return await testChannel.invokeMethod("popMessage"); //invokeMthod调用方法可以添加参数
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        child: const Text("test"),
        //TIPS: future usaging
        onPressed: () {
          test().then((value) => debugPrint(value));
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 133, 128, 155),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      transform: Matrix4.rotationZ(math.pi / 0),
      // alignment: Alignment.bottomCenter,

      child: const Text(
        "Welcome Home Welcome Home Welcome Home",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textScaleFactor: 2,
        style: TextStyle(
          color: Color.fromARGB(255, 100, 250, 300),
          fontSize: 10,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.dashed,
          decorationThickness: 3,
        ),
      ),
    ));
  }
}
