import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dart_vlc/dart_vlc.dart';

class MyHomePageWindows extends StatefulWidget {
  const MyHomePageWindows({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePageWindows> createState() => _MyHomePageWindowsState();
}

class _MyHomePageWindowsState extends State<MyHomePageWindows> {
  Player player = Player(id: 0, registerTexture: false);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      player.open(Media.asset('assets/sample.mp4'), autoStart: true);
      player.play();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: NativeVideo(
                player: player,
                height: 1920,
                width: 1080,
                showControls: false,
                scale: 1,
              ))), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
