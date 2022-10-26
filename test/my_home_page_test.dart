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
  }));
}
