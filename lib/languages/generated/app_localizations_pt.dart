import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get next => 'Próximo';

  @override
  String get skip => 'Pular';

  @override
  String get start => 'Iniciar';

  @override
  String get firstWelcomeView => 'Está construindo, ou precisa reformar sua casa e não sabe como economizar dinheiro sem perder qualidade na hora de pintar?';

  @override
  String get secondWelcomeView => 'Estamos aqui para te ajudar nessa decisão! Vamos calcular a quantidade de tinta necessária para os cômodos da sua casa?';
}
