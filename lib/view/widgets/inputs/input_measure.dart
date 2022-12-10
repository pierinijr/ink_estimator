import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/themes/fonts.dart';

class InputMeasure extends StatefulWidget {
  const InputMeasure({
    Key? key,
    required this.controller,
    required this.placeHolder,
    this.value = "",
    this.disable = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeHolder;
  final String value;
  final bool disable;

  String? validate(String? value) {
    return null;
  }

  @override
  State<InputMeasure> createState() => _InputMeasureState();
}

class _InputMeasureState extends State<InputMeasure> {
  @override
  void initState() {
    widget.controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.spacings.spacing12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.18,
        height: 40,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], //
          readOnly: widget.disable,
          validator: widget.validate,
          controller: widget.controller,
          onChanged: (value) => {},
          style: const TextStyle(
              fontFamily: fontPoppins,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryColor),
          decoration: InputDecoration(
            hintText: widget.placeHolder,
            hintStyle: const TextStyle(
                fontFamily: fontPoppins,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor),
            contentPadding: EdgeInsets.all(Constants.spacings.spacing6),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
            ),
            fillColor: AppColors.secondaryColor,
            filled: true,
          ),
        ),
      ),
    );
  }
}
