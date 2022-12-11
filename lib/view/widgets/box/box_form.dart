import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/core/constants/modal.dart';
import 'package:ink_estimator/core/utils.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/result_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/box/box_buttons.dart';
import 'package:ink_estimator/view/widgets/box/box_input.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';
import 'package:ink_estimator/view_model/room_view_model.dart';
import 'package:provider/provider.dart';

class BoxForm extends StatefulWidget {
  const BoxForm({super.key});

  @override
  State<BoxForm> createState() => _BoxFormState();
}

class _BoxFormState extends State<BoxForm> {
  final heightInputController = TextEditingController();
  final widthInputController = TextEditingController();
  final doorsInputController = TextEditingController();
  final windowsInputController = TextEditingController();

  void saveData() {
    ResultModel result = Provider.of<RoomViewModel>(context, listen: false)
        .saveData(
            context,
            heightInputController.text,
            widthInputController.text,
            doorsInputController.text,
            windowsInputController.text);
            
    if (result.success) {
      Utils.showToast(result.message, AppColors.success);
      Navigator.pop(context);
    } else {
      Utils.showToast(result.message, AppColors.error);
    }
  }

  void cleanFormData() {
    heightInputController.text = "";
    widthInputController.text = "";
    doorsInputController.text = "";
    windowsInputController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
            top: Constants.spacings.spacing12,
            bottom: Constants.spacings.spacing36),
        child: LabelH2(label: AppLocalizations.of(context)!.initCardModal),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            BoxInput(
              controller: heightInputController,
              label: AppLocalizations.of(context)!.height,
              placeHolder: AppLocalizations.of(context)!.centimeters,
              image: ConstantsModal.images.heightModalImage,
            ),
            BoxInput(
                controller: widthInputController,
                label: AppLocalizations.of(context)!.width,
                placeHolder: AppLocalizations.of(context)!.centimeters,
                image: ConstantsModal.images.widthModalImage),
            BoxInput(
              controller: doorsInputController,
              label: AppLocalizations.of(context)!.doors,
              placeHolder: AppLocalizations.of(context)!.quantityExample,
              image: ConstantsModal.images.doorsModalImage,
            ),
            BoxInput(
              controller: windowsInputController,
              label: AppLocalizations.of(context)!.windows,
              placeHolder: AppLocalizations.of(context)!.quantityExample,
              image: ConstantsModal.images.windowsModalImage,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: Constants.spacings.spacing36,
          bottom: Constants.spacings.spacing12,
        ),
        child: BoxButtons(
          firstTitle: AppLocalizations.of(context)!.save,
          firstAction: () {
            saveData();
          },
          secondTitle: AppLocalizations.of(context)!.clean,
          secondAction: () {
            cleanFormData();
          },
        ),
      ),
    ]);
  }
}
