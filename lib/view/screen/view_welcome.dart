import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/view/widgets/box/box_buttons.dart';

class ViewWelcome extends StatefulWidget {
  const ViewWelcome({super.key});

  @override
  State<ViewWelcome> createState() => _ViewWelcomeState();
}

class _ViewWelcomeState extends State<ViewWelcome> {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
        body: BoxButtons(
      firstTitle: AppLocalizations.of(context)!.next,
      firstAction: () {
        print("Button 1");
      },
      secondTitle: AppLocalizations.of(context)!.skip,
      secondAction: () {
        print("Button 2");
      },
    ));
  }
}
