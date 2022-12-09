import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/themes/fonts.dart';

class LabelBase extends StatelessWidget {
  const LabelBase(
      {Key? key,
      required this.fontSize,
      required this.label,
      this.height = 1,
      this.color = AppColors.primaryColor,
      this.fontWeightType = FontWeight.normal,
      this.textAlign = TextAlign.center})
      : super(key: key);

  final String label;
  final FontWeight fontWeightType;
  final double height;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontPoppins,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeightType,
        color: color,
      ),
    );
  }
}
