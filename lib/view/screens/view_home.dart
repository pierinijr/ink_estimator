import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/alerts/alert_dialog_help.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: const SizedBox(),
        title: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(Constants.images.logo, fit: BoxFit.cover),
          ),
        ),
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              icon: const Icon(Icons.help_outline,
                  color: AppColors.primaryColor, size: 20),
              onPressed: () {
                showDialogUnderstandScore(context);
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[],
        ),
      ),
    );
  }
}
