import 'package:flutter/material.dart';
import 'package:ink_estimator/view/screen/view_welcome.dart';
import 'package:ink_estimator/view/screen/view_home.dart';

final Map<String, WidgetBuilder> routes = {
  "/welcome": (context) => const ViewWelcome(),
  "/home": (context) => const ViewHome(),
};