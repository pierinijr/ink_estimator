# Boas vindas ao repositório Ink Estimator!

- Nesse projeto foi desenvolvido uma aplicação mobile que ajuda o usuário a calcular a quantidade de tinta necessária para pintar uma sala.

- Essa aplicação considera que a sala é composta de 4 paredes e permite que o usuário escolha qual a medida de cada parede e quantas janelas e portas possuem cada parede.

- Com base na quantidade necessária o sistema aponta tamanhos de lata de tinta que o usuário deve comprar, sempre priorizando as latas maiores. 
  Ex: se o usuário precisa de 19 litros, ele sugere 1 lata de 18L + 2 latas de 0,5L

---

## 🛠 Tecnologias

Esse projeto foi desenvolvido utilizando:

* [Flutter](https://flutter.dev/)
* [Provider](https://pub.dev/packages/provider/)
* [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash/)
* [Smooth Page Indicator](https://pub.dev/packages/smooth_page_indicator/)
* [Fluttertoast](https://pub.dev/packages/fluttertoast/)

Versões utilizadas no desenvolvimento:

* Flutter 3.3.9 • channel stable
* Dart 2.18.5 • DevTools 2.15.0

---

## 📋 Execução

ATENÇÃO: Se você ainda não possui o flutter instalado e configurado, acesse o [site oficial](https://docs.flutter.dev/get-started/install), e siga as instruções da documentação.

Antes de executar o projeto, você precisa ter instalado as seguintes ferramentas:

* Um editor de sua preferência. Utilizei o [VSCode](https://code.visualstudio.com) no desenvolvimento do projeto.
* O sistema de controle de versões [Git](https://git-scm.com).

Com os softwares instalados, siga as instruções abaixo:

```bash
# Clonar o repositório
git clone https://github.com/pimentajr/ink_estimator.git

# Entrar no diretório
cd ink_estimator

# Baixar as dependências
flutter pub get

# Executar testes
flutter test

Observação: Para rodar os testes antes do build no emulador, é necessário rodar o comando 'flutter build apk', caso contrário, poderá apresentar erros ao encontrar os arquivos do AppLocalizations.

# Executar projeto
Execute o projeto em um emulador Android ou iOS.
```
