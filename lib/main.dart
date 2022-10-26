import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  static const Key usernameInputKey = Key('MyHomePage_usernameInputKey');
  static const Key passwordInputKey = Key('MyHomePage_passwordInputKey');
  static const Key loginButtonKey = Key('MyHomePage_loginButtonKey');
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDD in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TDD'),
        ),
        body: Container(),
      ),
    );
  }
}
