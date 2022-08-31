// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';
import 'package:path/path.dart' as path;

var libraryPath =
    path.join(Directory.current.parent.path, "assets\\windll\\sysinfo.dll");

final dylib = DynamicLibrary.open(libraryPath);

final Pointer<T> Function<T extends NativeType>(String symbolName) lookup =
    dylib.lookup;

//**********************
final helloWorldPtr = lookup<NativeFunction<Void Function()>>('helloworld');
final helloWorld = helloWorldPtr.asFunction<void Function()>();

final addPtr = lookup<NativeFunction<Int Function(Int x, Int y)>>('add');
final add = addPtr.asFunction<int Function(int x, int y)>();

final subPtr = lookup<NativeFunction<Int Function(Int x, Int y)>>('sub');
final sub = subPtr.asFunction<int Function(int x, int y)>();

final getCpuUsagePtr = lookup<NativeFunction<Double Function()>>('getCpuUsage');
final getCpuUsage = getCpuUsagePtr.asFunction<double Function()>();

final getMemoryRatePtr =
    lookup<NativeFunction<Void Function()>>('getMemoryRate');
final getMemoryRate = getMemoryRatePtr.asFunction<void Function()>();

final socketMainPtr = lookup<NativeFunction<Int Function()>>('socketMain');
final socketMain = socketMainPtr.asFunction<int Function()>();

// *************** 1. Dart调用C方法 **************
void main(List<String> args) {
  helloWorld();
  int c = add(1, 2);
  int d = sub(2, 1);
  double cpuU = getCpuUsage();
  getMemoryRate();
  print(c);
  print(d);
  print(cpuU);
  socketMain();
}
