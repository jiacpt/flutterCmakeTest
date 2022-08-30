import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

// Main
void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
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

// HomePage
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertDialog Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Show AlertDialog"),
          onPressed: () {
            showAlertDialog(context);
          },
        ),
      ),
    );
  }
}

// Show AlertDialog
showAlertDialog(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: const Text("AlertDialog component"),
    actions: [
      ElevatedButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          }),
      ElevatedButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );

  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}
