import 'package:flutter/material.dart';
import 'package:ink_estimator/core/routes.dart';

class InkEstimator extends StatelessWidget {
  const InkEstimator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/welcome",
      routes: routes,
    );
  }
}