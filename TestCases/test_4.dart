import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/Home/home.dart';

void main() {
  group('Home Widget Test', () {
    testWidgets('Widget UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: home()));

      // Test if the 'Paakshala' text is displayed
      expect(find.text('Paakshala'), findsOneWidget);

      // Test if the 'Your consumption this week' text is displayed
      expect(find.text('Your consumption this week'), findsOneWidget);

      // Test if the Container is present
      expect(find.byType(Container), findsOneWidget);

      // Test if the IconButton is present
      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
