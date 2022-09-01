/* import 'dart:ffi' as ffi;
import 'package:win32/win32.dart' as w32;
 */
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'dash_board.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1000, 600);
    win.minSize = const Size(500, 600);
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SideMenu(
                controller: page,
                style: SideMenuStyle(
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: Colors.blue[100],
                  selectedColor: Colors.lightBlue,
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
                ),
                title: Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 100,
                          maxWidth: 100,
                        ),
                        child: const Text("______")),
                    const Divider(
                      indent: 8.0,
                      endIndent: 8.0,
                    ),
                  ],
                ),
                footer: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'By Jiacpt',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Dashboard',
                    onTap: () {
                      page.jumpToPage(0);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Users',
                    onTap: () {
                      page.jumpToPage(1);
                    },
                    icon: const Icon(Icons.supervisor_account),
                  ),
                  SideMenuItem(
                    priority: 2,
                    title: 'Files',
                    onTap: () {
                      page.jumpToPage(2);
                    },
                    icon: const Icon(Icons.file_copy_rounded),
                  ),
                  SideMenuItem(
                    priority: 3,
                    title: 'Download',
                    onTap: () {
                      page.jumpToPage(3);
                    },
                    icon: const Icon(Icons.download),
                  ),
                  SideMenuItem(
                    priority: 4,
                    title: 'Settings',
                    onTap: () {
                      page.jumpToPage(4);
                    },
                    icon: const Icon(Icons.settings),
                  ),
                  SideMenuItem(
                    priority: 6,
                    title: 'Exit',
                    onTap: () async {},
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: page,
                  children: [
                    const Dashboard(),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Users',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Files',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Download',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
