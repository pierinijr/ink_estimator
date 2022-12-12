import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('pt')
  ];

  /// No description provided for @next.
  ///
  /// In pt, this message translates to:
  /// **'Próximo'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In pt, this message translates to:
  /// **'Pular'**
  String get skip;

  /// No description provided for @start.
  ///
  /// In pt, this message translates to:
  /// **'Iniciar'**
  String get start;

  /// No description provided for @close.
  ///
  /// In pt, this message translates to:
  /// **'Fechar'**
  String get close;

  /// No description provided for @calculate.
  ///
  /// In pt, this message translates to:
  /// **'Calcular'**
  String get calculate;

  /// No description provided for @clean.
  ///
  /// In pt, this message translates to:
  /// **'Limpar'**
  String get clean;

  /// No description provided for @firstWelcomeView.
  ///
  /// In pt, this message translates to:
  /// **'Está construindo, ou precisa reformar sua casa e não sabe como economizar dinheiro sem perder qualidade na hora de pintar?'**
  String get firstWelcomeView;

  /// No description provided for @secondWelcomeView.
  ///
  /// In pt, this message translates to:
  /// **'Estamos aqui para te ajudar nessa decisão! Vamos calcular a quantidade de tinta necessária para os cômodos da sua casa?'**
  String get secondWelcomeView;

  /// No description provided for @introAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Para deixar sua casa como voce sempre sonhou, temos várias medidas diferentes em cada cômodo. Como queremos te ajudar a pintar as paredes economizando o máximo de tinta possivel, não podemos esquecer das portas e das janelas não é mesmo? Então, para que possamos ter um cálculo mais preciso, seguimos algumas regras:'**
  String get introAppHelp;

  /// No description provided for @firstRuleAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'1 - Nenhuma parede pode ter menos de 1 metro quadrado nem mais de 50 metros quadrados, mas podem possuir alturas e larguras diferentes.'**
  String get firstRuleAppHelp;

  /// No description provided for @secondRuleAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'2 - O total de área das portas e janelas deve ser no máximo 50% da área de parede.'**
  String get secondRuleAppHelp;

  /// No description provided for @thirdRuleAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'3 - A altura de paredes com porta deve ser, no mínimo, 30 centímetros maior que a altura da porta.'**
  String get thirdRuleAppHelp;

  /// No description provided for @firstQuestionAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Mas e se alguma regra não for cumprida? Não precisa se preocupar! É importante garantirmos a qualidade das informações que estamos fornecendo. Você terá uma notificação exibida na tela que algo está errado, e como resolver. Lembrando que não iremos calcular até que os dados se enquadrem nas regras, tudo bem?'**
  String get firstQuestionAppHelp;

  /// No description provided for @secondQuestionAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Outra dúvida muito importante, é sobre o tamanho das portas e janelas. Nas próximas atualizações, vamos trazer opções mais avançadas para dimensionar cada um dos itens que você pode ter na sua parede, mas no momento, levamos em consideração as dimensões abaixo:'**
  String get secondQuestionAppHelp;

  /// No description provided for @measurementsAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Cada porta possui as medidas: 0,80 x 1,90\nCada janela possui as medidas: 2,00 x 1,20'**
  String get measurementsAppHelp;

  /// No description provided for @variationAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Variações das latas de tinta que levamos em consideração:'**
  String get variationAppHelp;

  /// No description provided for @measuresOfCansAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'0,5 L\n2,5 L\n3,6 L\n18 L'**
  String get measuresOfCansAppHelp;

  /// No description provided for @commentsAppHelp.
  ///
  /// In pt, this message translates to:
  /// **'Observação: Sempre confira o rendimento da marca que você está comprando. Cada litro de tinta considerado nos cálculos é capaz de pintar 5 metros quadrados.'**
  String get commentsAppHelp;

  /// No description provided for @initPageHome.
  ///
  /// In pt, this message translates to:
  /// **'Para podermos te ajudar, preencha os campos abaixo com as medidas em centímetro quadrado do seu cômodo. Caso precise de ajuda, ou queira entender o cálculo que realizamos basta clicar no ponto de interrogação aqui em cima.'**
  String get initPageHome;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
