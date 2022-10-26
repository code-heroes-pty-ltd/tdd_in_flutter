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

class MyHomePage extends StatefulWidget {
  static const Key usernameInputKey = Key('MyHomePage_usernameInputKey');
  static const Key passwordInputKey = Key('MyHomePage_passwordInputKey');
  static const Key loginButtonKey = Key('MyHomePage_loginButtonKey');
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoginButtonEnabled = false;

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
        body: Column(
          children: [
            TextField(
              key: MyHomePage.usernameInputKey,
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              onChanged: (value) => _checkValue(),
            ),
            TextField(
              key: MyHomePage.passwordInputKey,
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (value) => _checkValue(),
            ),
            ElevatedButton(
              key: MyHomePage.loginButtonKey,
              onPressed: isLoginButtonEnabled ? () {
                /// Login
              } : null,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _checkValue() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        isLoginButtonEnabled = false;
      });
    } else {
      setState(() {
        isLoginButtonEnabled = true;
      });
    }
  }
}
