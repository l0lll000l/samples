1. why flutter                = flutter is free and open source ui framework,introduced by google in may 2017,flutter enables you to create native mobile applications with single codebase.
                              = flutter suppport crossplatform development,easy,building process is faster
2. class                      = a blueprint for creating objects .it is an essential part of object oriented programming
3. Function                   = a set of codes that together perform a specific task 
4. what is packages & plugins = pre-built  set of code,libraries,or modules that can be integrated into an app to perform specific task or provide certain features.
5. Object                     = a variable or instance of the class used to access the class properties
6. Limitaions                 = thirdparty library is small, release size is larger
7. why does it take a long time to develop fluttter app = flutter generaqte device specific ipa or apk file,uses x code and graddle to build file
8. what are keys              = unique identifiers that are attached to widgets. value key,global key,
9. streams in dart            
= signle subsctription sream = allows only one listener at a time

import 'dart:async';

void main() {
  Stream<int> stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  stream.listen((data) {
    print('Single-Subscription Stream: $data');
  });
}
OUTPUT: 
//Single-Subscription Stream: 1
//Single-Subscription Stream: 2
//Single-Subscription Stream: 3
//Single-Subscription Stream: 4
//Single-Subscription Stream: 5
-------------------------------------------------------------------
= Broadcast stream =allows multiple listeners and typically used for events
import 'dart:async';

void main() {
  StreamController<int> controller = StreamController<int>.broadcast();

  controller.stream.listen((data) {
    print('Broadcast Stream Listener 1: $data');
  });

  controller.stream.listen((data) {
    print('Broadcast Stream Listener 2: $data');
  });

  controller.add(1);
  controller.add(2);
  controller.add(3);
  controller.close();
}
OUTPUT
//Broadcast Stream Listener 1: 1
//Broadcast Stream Listener 2: 1
//Broadcast Stream Listener 1: 2
//Broadcast Stream Listener 2: 2
//Broadcast Stream Listener 1: 3
//Broadcast Stream Listener 2: 3

10. pubspec.yaml                 = it is a configurationn file. that specifies the project's dependencies,such as packages and their versions
11. 4 main elements              = flutter engine
                                   widgets
                                   design-specific widgets
                                   foundation library
12. name some best editors       = android studio
                                   visual studio
                                   emac
                                   codemagic
                                   intelluj idea
13. stateless widget             = immutable,its properties cannot change onnce the widget is built
                                   doesnot have state
                                   
14. statefull Widget             = mutable , its properties change over time
                                   manage state using setstate
                                   


