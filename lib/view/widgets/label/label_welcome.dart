import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_base.dart';

class LabelWelcome extends LabelBase {
  LabelWelcome({
    Key? key,
    required label,
    fontWeightType = FontWeight.w800
  }) : super(
            key: key,
            label: label,
            fontSize: 28,
            height: 1.5,
            fontWeightType: FontWeight.w800,
            color: AppColors.neutrals.shade200,
            textAlign: TextAlign.start
            );
}