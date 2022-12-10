import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/inputs/input_measure.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';

class BoxInput extends StatefulWidget {
  const BoxInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.placeHolder,
    required this.image,
    this.color = AppColors.secondaryColor,
    this.value = "",
    this.isRequired = true,
    this.disable = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String placeHolder;
  final String image;
  final Color color;
  final String value;
  final bool isRequired;
  final bool disable;

  @override
  State<BoxInput> createState() => _BoxInputState();
}

class _BoxInputState extends State<BoxInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Constants.spacings.spacing6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.spacings.spacing12),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image),
                          alignment: Alignment.bottomRight,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelH2(label: widget.label),
                  ],
                ),
              ],
            ),
              InputMeasure(
                  controller: widget.controller,
                  placeHolder: widget.placeHolder,
                  value: widget.value,
                  disable: widget.disable)
          ],
        ),
      ),
    );
  }
}
