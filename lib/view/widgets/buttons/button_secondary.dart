import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/buttons/button_base.dart';

class ButtonSecondary extends ButtonBase {
  const ButtonSecondary({
    Key? key,
    required title,
    required action,
    isDisabled = false,
  }) : super(
            key: key,
            title: title,
            action: action,
            buttonColor: Colors.transparent,
            labelColor: AppColors.primaryColor,
            );
}
