import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainView(),
    ),
  );
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1000, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  /// Views to display
  List<Widget> views = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// You can use an AppBar if you want to
        // The row is needed to display the current view
        body: Column(
      children: [
        Container(
          height: 30,
          color: Colors.amber,
          child: WindowTitleBarBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("   "),
                const Icon(
                  Icons.abc,
                  size: 35,
                ),
                const Text(
                  "  Flutter",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
                Expanded(child: MoveWindow()),
                const WindowButtons()
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              /// Pretty similar to the BottomNavigationBar!
              SideNavigationBar(
                selectedIndex: selectedIndex,
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.person,
                    label: 'Account',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Settings',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              /// Make it take the rest of the available width
              Expanded(
                child: views.elementAt(selectedIndex),
              )
            ],
          ),
        )
      ],
    ));
  }
}

///
/// ButtonState
///
final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
