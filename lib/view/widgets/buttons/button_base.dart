import 'package:flutter/material.dart';
import 'package:ink_estimator/themes/fonts.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    super.key,
    required this.title,
    required this.action,
    required this.buttonColor,
    required this.labelColor,
    this.labelWeigth = FontWeight.w400,
    this.buttonHeight = 40,
    this.buttonWidth = 250,
    this.borderRadius = 10,
    this.isDisabled = false,
  });

  final String title;
  final Function action;
  final Color buttonColor;
  final Color labelColor;
  final FontWeight labelWeigth;
  final double buttonHeight;
  final double buttonWidth;
  final double borderRadius;
  final bool isDisabled;

  void callAction() {
    action();
  }

  @override
  State<ButtonBase> createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.buttonHeight,
        width: widget.buttonWidth,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double?>(0),
              backgroundColor: MaterialStateProperty.all(widget.buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ))),
          onPressed: () {
            widget.callAction();
          },
          child: Align(
            child: Text(
              widget.title,
              style: TextStyle(
                  color: widget.labelColor,
                  fontSize: 16,
                  fontFamily: fontPoppins,
                  fontWeight: widget.labelWeigth),
            ),
          ),
        ));
  }
}
