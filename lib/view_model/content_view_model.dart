import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/home.dart';
import 'package:ink_estimator/core/constants/welcome.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/content_model.dart';

class ContentViewModel extends ChangeNotifier {
  List<ContentModel> getScreenList(BuildContext context) {
    List<ContentModel> screenList = [
      ContentModel(
          label: AppLocalizations.of(context)!.firstWelcomeView,
          image: ConstantsWelcome.images.firstImage),
      ContentModel(
          label: AppLocalizations.of(context)!.secondWelcomeView,
          image: ConstantsWelcome.images.secondImage),
    ];
    return screenList;
  }

  List<ContentModel> getCardsParameters(BuildContext context) {
    List<ContentModel> cardsParameters = [
      ContentModel(
          label: AppLocalizations.of(context)!.front,
          image: ConstantsHome.images.firstCardImage),
      ContentModel(
          label: AppLocalizations.of(context)!.left,
          image: ConstantsHome.images.secondCardImage),
      ContentModel(
          label: AppLocalizations.of(context)!.right,
          image: ConstantsHome.images.thirdCardImage),
      ContentModel(
          label: AppLocalizations.of(context)!.back,
          image: ConstantsHome.images.fourthCardImage),
    ];
    return cardsParameters;
  }

  List<ContentModel> getHelpContent(BuildContext context) {
    List<ContentModel> content = [
      ContentModel(label: AppLocalizations.of(context)!.introAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.firstRuleAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.secondRuleAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.thirdRuleAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.firstQuestionAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.secondQuestionAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.measurementsAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.variationAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.measuresOfCansAppHelp),
      ContentModel(label: AppLocalizations.of(context)!.commentsAppHelp),
    ];
    return content;
  }
}
