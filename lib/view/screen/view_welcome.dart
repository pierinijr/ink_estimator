import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ViewWelcome extends StatefulWidget {
  const ViewWelcome({super.key});

  @override
  State<ViewWelcome> createState() => _ViewWelcomeState();
}

class _ViewWelcomeState extends State<ViewWelcome> {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
          ],
        ),
      ),
    );
  }
}