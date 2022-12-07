import 'package:flutter/material.dart';
import 'package:ink_estimator/pages/home.dart';

class InkEstimator extends StatelessWidget {
  const InkEstimator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}