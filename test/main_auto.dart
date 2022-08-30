import 'package:flutter/material.dart';

import 'dart:ui';

void main() {
  runApp(const MyApp());
}

//TIPS: 桌面端实现触摸效果
const Set<PointerDeviceKind> _kTouchLikeDeviceTypes = <PointerDeviceKind>{
  PointerDeviceKind.touch,
  PointerDeviceKind.mouse,
  PointerDeviceKind.stylus,
  PointerDeviceKind.invertedStylus,
  PointerDeviceKind.unknown
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: const MaterialScrollBehavior()
            .copyWith(scrollbars: true, dragDevices: _kTouchLikeDeviceTypes),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Flutter 助手",
            ),
          ),
          body: ChildsAuto(),
        ));
  }
}

class ChildsAuto extends StatelessWidget {
  final list = [];
  ChildsAuto({Key? key}) : super(key: key) {
    for (int i = 0; i < 10; i++) {
      list.add("value: $i !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 400.0,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: const Icon(Icons.verified_user),
                title: Text(
                  "${list[index]}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(Icons.arrow_right),
              );
            })));
  }
}
