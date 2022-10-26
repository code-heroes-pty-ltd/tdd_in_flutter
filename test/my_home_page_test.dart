import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_in_flutter/main.dart';

void main() {
  group('Home Page UI', (() {
    testWidgets(
        'GIVEN the Home Page is open '
        'THEN I see a username input field '
        'AND I see a password input field '
        'AND I see a login button ', (WidgetTester tester) async {
      await tester.pumpWidget(MyHomePage());
      await tester.pump();

      expect(find.byKey(MyHomePage.usernameInputKey), findsOneWidget);
      expect(find.byKey(MyHomePage.passwordInputKey), findsOneWidget);
      expect(find.byKey(MyHomePage.loginButtonKey), findsOneWidget);
    });
    testWidgets(
        'GIVEN the Home Page is open '
        'WHEN I type a value into the password field '
        'THEN I see the password is obscured ', (WidgetTester tester) async {
      await tester.pumpWidget(MyHomePage());
      await tester.pump();

      final passwordInput = tester.widget(find.byKey(MyHomePage.passwordInputKey)) as TextField;
      expect(passwordInput.obscureText, true);
    });
    testWidgets(
        'GIVEN the Home Page is open '
        'WHEN I type a value into the username field '
        'AND I type a value into the password field '
        'THEN I see the login button is not disabled ', (WidgetTester tester) async {
      await tester.pumpWidget(MyHomePage());
      await tester.pump();

      await tester.enterText(find.byKey(MyHomePage.usernameInputKey), 'username');
      await tester.enterText(find.byKey(MyHomePage.passwordInputKey), 'password');
      await tester.pumpAndSettle();

      final loginButton = tester.widget(find.byKey(MyHomePage.loginButtonKey)) as ElevatedButton;
      expect(loginButton.onPressed, isNotNull);
    });
    testWidgets(
        'GIVEN the Home Page is open '
        'WHEN I type a value into the username field '
        'THEN I see the login button is disabled ', (WidgetTester tester) async {
      await tester.pumpWidget(MyHomePage());
      await tester.pump();

      await tester.enterText(find.byKey(MyHomePage.usernameInputKey), 'username');
      await tester.pumpAndSettle();

      final loginButton = tester.widget(find.byKey(MyHomePage.loginButtonKey)) as ElevatedButton;
      expect(loginButton.onPressed, isNull);
    });
    testWidgets(
        'GIVEN the Home Page is open '
        'WHEN I type a value into the password field '
        'THEN I see the login button is disabled ', (WidgetTester tester) async {
      await tester.pumpWidget(MyHomePage());
      await tester.pump();

      await tester.enterText(find.byKey(MyHomePage.passwordInputKey), 'password');
      await tester.pumpAndSettle();

      final loginButton = tester.widget(find.byKey(MyHomePage.loginButtonKey)) as ElevatedButton;
      expect(loginButton.onPressed, isNull);
    });
  }));
}
