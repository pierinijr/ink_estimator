import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_base.dart';

class LabelH2 extends LabelBase {
  const LabelH2({
    Key? key,
    required label,
    fontWeightType = FontWeight.normal,
    height = 1.5,
    textAlign = TextAlign.start
  }) : super(
            key: key,
            label: label,
            fontSize: 14,
            height: height,
            fontWeightType: fontWeightType,
            color: AppColors.primaryColor,
            textAlign: textAlign
            );
}