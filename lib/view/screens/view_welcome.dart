import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ink_estimator/core/utils.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/content_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/box/box_buttons.dart';
import 'package:ink_estimator/view/widgets/pageview/pageview_welcome.dart';
import 'package:ink_estimator/view_model/content_view_model.dart';
import 'package:ink_estimator/view_model/welcome_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewWelcome extends StatefulWidget {
  const ViewWelcome({super.key});

  @override
  State<ViewWelcome> createState() => _ViewWelcomeState();
}

class _ViewWelcomeState extends State<ViewWelcome> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    List<ContentModel> screenList =
        Provider.of<ContentViewModel>(context, listen: false)
            .getScreenList(context);
    WelcomeViewModel roomViewModel = context.watch<WelcomeViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        PageView(
          onPageChanged: (page) {
            Provider.of<WelcomeViewModel>(context, listen: false)
                .setWelcomeView(page);
          },
          controller: _pageController,
          children: [
            ...List.generate(
              screenList.length,
              (index) => PageViewWelcome(
                index: index,
                screenList: screenList,
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  roomViewModel.indicatorsPages < screenList.length - 1
                      ? BoxButtons(
                          firstTitle: AppLocalizations.of(context)!.next,
                          firstAction: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          secondTitle: AppLocalizations.of(context)!.skip,
                          secondAction: () {
                            Utils.goView(context, "/home");
                          },
                        )
                      : BoxButtons(
                          firstTitle: AppLocalizations.of(context)!.start,
                          firstAction: () {
                            Utils.goView(context, "/home");
                          })
                ],
              )),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.18,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: screenList.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  expansionFactor: 2,
                  dotColor: AppColors.neutrals.shade200,
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
