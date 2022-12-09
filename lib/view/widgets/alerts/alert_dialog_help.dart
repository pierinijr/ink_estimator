import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/buttons/button_primary.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';

class AlertDialogHelp extends StatelessWidget {
  const AlertDialogHelp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> content = getContent(context);
    return AlertDialog(
        backgroundColor: AppColors.secondaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        contentPadding: EdgeInsets.all(Constants.spacings.spacing24),
        alignment: Alignment.center,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: Constants.spacings.spacing16),
                    child: LabelH2(label: content[index]["label"]),
                  );
                },
              ),
            ),
            ButtonPrimary(
              action: () => Navigator.pop(context),
              title: AppLocalizations.of(context)!.close,
            )
          ],
        ));
  }
}

List<Map<String, dynamic>> getContent(BuildContext context) {
  List<Map<String, dynamic>> content = [
      {"label": AppLocalizations.of(context)!.introAppHelp},
      {"label": AppLocalizations.of(context)!.firstRuleAppHelp},
      {"label": AppLocalizations.of(context)!.secondRuleAppHelp},
      {"label": AppLocalizations.of(context)!.thirdRuleAppHelp},
      {"label": AppLocalizations.of(context)!.firstQuestionAppHelp},
      {"label": AppLocalizations.of(context)!.secondQuestionAppHelp},
      {"label": AppLocalizations.of(context)!.measurementsAppHelp},
      {"label": AppLocalizations.of(context)!.variationAppHelp},
      {"label": AppLocalizations.of(context)!.measuresOfCansAppHelp},
      {"label": AppLocalizations.of(context)!.commentsAppHelp},
    ];
  return content;
}

Future<void> showDialogUnderstandScore(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => const AlertDialogHelp(),
  );
}
