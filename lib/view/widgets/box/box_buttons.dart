import 'package:flutter/material.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/view/widgets/buttons/button_primary.dart';
import 'package:ink_estimator/view/widgets/buttons/button_secondary.dart';

class BoxButtons extends StatefulWidget {
  const BoxButtons({
    super.key,
    required this.firstTitle,
    required this.firstAction,
    this.secondTitle,
    this.secondAction,
    this.firstDisabled = false,
    this.secondDisabled = false
  });

  final String firstTitle;
  final Function firstAction;
  final String? secondTitle;
  final Function? secondAction;
  final bool firstDisabled;
  final bool secondDisabled;

  @override
  State<BoxButtons> createState() => _BoxButtonsState();
}

class _BoxButtonsState extends State<BoxButtons> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonPrimary(
              title: widget.firstTitle,
              action: widget.firstAction
            ),
            widget.secondTitle != null && widget.secondAction != null 
              ? ButtonSecondary(
                title: AppLocalizations.of(context)!.skip,
                action: () {
                  print("Button 2");
                },
              )
              : const SizedBox(height: 40, width: 250)
          ],
        ),
      );
  }
}