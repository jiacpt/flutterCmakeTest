import 'package:flutter/material.dart';

import 'dart:ui';

void main() {
  runApp(const MyApp());
}

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
          body: FlexLayout(),
        ));
  }
}

class FlexLayout extends StatelessWidget {
  FlexLayout({Key? key}) : super(key: key) {
    debugPrint("d");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        color: Colors.black,
        padding: const EdgeInsets.all(10),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
