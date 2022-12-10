import 'package:flutter/material.dart';
import 'package:ink_estimator/core/routes.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/view_model/content_view_model.dart';
import 'package:ink_estimator/view_model/welcome_view_model.dart';
import 'package:provider/provider.dart';


class InkEstimator extends StatelessWidget {
  const InkEstimator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WelcomeViewModel()),
          ChangeNotifierProvider(create: (_) => ContentViewModel()),
        ],
        child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/welcome",
        routes: routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}