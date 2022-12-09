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
  String get close => 'Fechar';

  @override
  String get calculate => 'Calcular';

  @override
  String get clean => 'Limpar';

  @override
  String get firstWelcomeView => 'Está construindo, ou precisa reformar sua casa e não sabe como economizar dinheiro sem perder qualidade na hora de pintar?';

  @override
  String get secondWelcomeView => 'Estamos aqui para te ajudar nessa decisão! Vamos calcular a quantidade de tinta necessária para os cômodos da sua casa?';

  @override
  String get introAppHelp => 'Para deixar sua casa como voce sempre sonhou, temos várias medidas diferentes em cada cômodo. Como queremos te ajudar a pintar as paredes economizando o máximo de tinta possivel, não podemos esquecer das portas e das janelas não é mesmo? Então, para que possamos ter um cálculo mais preciso, seguimos algumas regras:';

  @override
  String get firstRuleAppHelp => '1 - Nenhuma parede pode ter menos de 1 metro quadrado nem mais de 50 metros quadrados, mas podem possuir alturas e larguras diferentes.';

  @override
  String get secondRuleAppHelp => '2 - O total de área das portas e janelas deve ser no máximo 50% da área de parede.';

  @override
  String get thirdRuleAppHelp => '3 - A altura de paredes com porta deve ser, no mínimo, 30 centímetros maior que a altura da porta.';

  @override
  String get firstQuestionAppHelp => 'Mas e se alguma regra não for cumprida? Não precisa se preocupar! É importante garantirmos a qualidade das informações que estamos fornecendo. Você terá uma notificação exibida na tela que algo está errado, e como resolver. Lembrando que não iremos calcular até que os dados se enquadrem nas regras, tudo bem?';

  @override
  String get secondQuestionAppHelp => 'Outra dúvida muito importante, é sobre o tamanho das portas e janelas. Nas próximas atualizações, vamos trazer opções mais avançadas para dimensionar cada um dos itens que você pode ter na sua parede, mas no momento, levamos em consideração as dimensões abaixo:';

  @override
  String get measurementsAppHelp => 'Cada porta possui as medidas: 0,80 x 1,90\nCada janela possui as medidas: 2,00 x 1,20';

  @override
  String get variationAppHelp => 'Variações das latas de tinta que levamos em consideração:';

  @override
  String get measuresOfCansAppHelp => '0,5 L\n2,5 L\n3,6 L\n18 L';

  @override
  String get commentsAppHelp => 'Observação: Sempre confira o rendimento da marca que você está comprando. Cada litro de tinta considerado nos cálculos é capaz de pintar 5 metros quadrados.';

  @override
  String get initPageHome => 'Para podermos te ajudar, preencha os campos abaixo com as medidas em centímetro quadrado do seu cômodo. Caso precise de ajuda, ou queira entender o cálculo que realizamos basta clicar no ponto de interrogação aqui em cima.';
}
