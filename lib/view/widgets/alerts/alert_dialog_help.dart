import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/content_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/buttons/button_primary.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';
import 'package:ink_estimator/view_model/content_view_model.dart';
import 'package:provider/provider.dart';

class AlertDialogHelp extends StatelessWidget {
  const AlertDialogHelp({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContentModel> content =
        Provider.of<ContentViewModel>(context, listen: false)
            .getHelpContent(context);
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
                    padding:
                        EdgeInsets.only(bottom: Constants.spacings.spacing16),
                    child: LabelH2(label: content[index].label),
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

Future<void> showHelpDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => const AlertDialogHelp(),
  );
}
