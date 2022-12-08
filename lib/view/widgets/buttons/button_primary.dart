import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/buttons/button_base.dart';

class ButtonPrimary extends ButtonBase {
  const ButtonPrimary({
    Key? key,
    required title,
    required action,
    isDisabled = false,
  }) : super(
            key: key,
            title: title,
            action: action,
            buttonColor: AppColors.primaryColor,
            labelColor: AppColors.secondaryColor,
            );
}
