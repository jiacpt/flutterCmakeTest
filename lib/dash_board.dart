import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  // final EditableText et1 = ;

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final List<Widget> infos = [];
  final sendController = TextEditingController();
  final sendFocusNode = FocusNode();
  final viewScrollController = ScrollController();

  sendText(value) => Container(
      height: 20,
      color: Colors.black,
      width: double.infinity,
      child: Text(
        "$value <<",
        textAlign: TextAlign.end,
        style: const TextStyle(
          color: Colors.white,
        ),
      ));

  int _sendCounter = 0;
  final int _recvCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 172, 172, 172),
      child: Column(children: [
        Text(
          "send: $_sendCounter ___ recv: $_recvCounter",
          textAlign: TextAlign.start,
        ),
        Container(
          height: 400,
          width: double.infinity,
          color: const Color.fromARGB(31, 252, 252, 252),
          child: SingleChildScrollView(
              controller: viewScrollController,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: infos)),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                  controller: sendController,
                  focusNode: sendFocusNode,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.send),
                      helperStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                      helperMaxLines: 1),
                  onSubmitted: (value) {
                    debugPrint(value);
                    setState(() {
                      infos.add(sendText(value));
                      _sendCounter++;
                    });
                    sendController.clear();
                    viewScrollController
                        .jumpTo(viewScrollController.position.maxScrollExtent);
                    FocusScope.of(context).requestFocus(sendFocusNode);
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    infos.add(sendText(sendController.text));
                    _sendCounter++;
                  });
                },
                child: const Text("send")),
          ],
        ),
      ]),
    );
  }
}
