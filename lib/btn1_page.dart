import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_outlined,
          ),
          title: WindowTitleBarBox(child: MoveWindow()),
        ),
        body: const Center(
          child: Text("This is new route"),
        ),
      ),
    );
  }
}
