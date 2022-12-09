import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ink_estimator/core/constants/welcome.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/box/box_buttons.dart';
import 'package:ink_estimator/view/widgets/pageview/pageview_welcome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewWelcome extends StatefulWidget {
  const ViewWelcome({super.key});

  @override
  State<ViewWelcome> createState() => _ViewWelcomeState();
}

class _ViewWelcomeState extends State<ViewWelcome> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _indicatorsPages = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final List<Map<String, dynamic>> screenList = [
      {
        "label": AppLocalizations.of(context)!.firstWelcomeView,
        "background_color": AppColors.secondaryColor,
        "image": ConstantsWelcome.images.firstImage,
      },
      {
        "label": AppLocalizations.of(context)!.secondWelcomeView,
        "background_color": AppColors.secondaryColor,
        "image": ConstantsWelcome.images.secondImage,
      }
    ];

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (page) {
            _indicatorsPages.value = page;
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
            child: ValueListenableBuilder<int>(
                valueListenable: _indicatorsPages,
                builder: (context, state, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      state < screenList.length - 1
                          ? BoxButtons(
                              firstTitle: AppLocalizations.of(context)!.next,
                              firstAction: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              secondTitle: AppLocalizations.of(context)!.skip,
                              secondAction: () {
                                // TODO: Atualizar localização da função
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/home",
                                  ModalRoute.withName('/welcome'),
                                );
                              },
                            )
                          : BoxButtons(
                              firstTitle: AppLocalizations.of(context)!.start,
                              firstAction: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/home",
                                  ModalRoute.withName('/welcome'),
                                );
                              })
                    ],
                  );
                }),
          ),
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
