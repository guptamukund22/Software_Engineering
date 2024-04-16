import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/cuisines/cuisines.dart';

void main() {
  group('Cuisines Widget Test', () {
    testWidgets('Widget UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Cuisines()));

      // Test if the 'Hello Sumeet' text is displayed
      expect(find.text('Hello Sumeet'), findsOneWidget);

      // Test if the 'Have recipe do you want today? Have a look!' text is displayed
      expect(find.text('Have recipe do you want today?\nHave a look!'),
          findsOneWidget);

      // Test if the SearchBar is present
      expect(find.byType(SearchBar), findsOneWidget);

      // Test if the TabBar is present
      expect(find.byType(TabBar), findsOneWidget);

      // Test if the 'All' and 'South Indian' tabs are displayed
      expect(find.text('All'), findsOneWidget);
      expect(find.text('South Indian'), findsOneWidget);

      // Test if the correct container is displayed based on the selected tab
      expect(find.byType(Container),
          findsNWidgets(2)); // Both containers should be present initially
      expect(find.byKey(ValueKey('selected_tab_0')),
          findsOneWidget); // Ensure the first container is displayed initially
    });

    testWidgets('Tab selection Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Cuisines()));

      // Tap on the 'South Indian' tab
      await tester.tap(find.text('South Indian'));
      await tester.pump();

      // Test if the correct container is displayed after tab selection
      expect(find.byKey(ValueKey('selected_tab_1')),
          findsOneWidget); // Ensure the second container is displayed after tapping the 'South Indian' tab
    });
  });
}
