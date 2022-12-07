import 'package:flutter/material.dart';
import 'package:ink_estimator/pages/welcome.dart';
import 'package:ink_estimator/pages/home.dart';

final Map<String, WidgetBuilder> routes = {
  "/welcome": (context) => const Welcome(),
  "/home": (context) => const Home(),
};