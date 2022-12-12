import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/model/content_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_welcome.dart';

class PageViewWelcome extends StatelessWidget {
  const PageViewWelcome({
    super.key,
    required this.index,
    required this.screenList,
  });

  final int index;
  final List<ContentModel> screenList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(screenList[index].image),
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacings.spacing24,
                    vertical: Constants.spacings.spacing48),
                child: LabelWelcome(label: screenList[index].label)),
          ),
        ],
      )),
    );
  }
}
