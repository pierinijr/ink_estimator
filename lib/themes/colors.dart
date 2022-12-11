import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF434E6E);

  static const secondaryColor = Color(0xFFE3E9F9);

  static const filterColor = Color(0xFF282A51);

  static const neutrals = MaterialColor(0xFFFFFFFF, neutralsShades);

  static const Map<int, Color> neutralsShades = {
    200: Color(0xFFFFFFFF),
    900: Color(0xFF000000),
  };

  static const success = Color(0xFF4ABB6B);

  static const error = Color(0xFFE2231A);
}