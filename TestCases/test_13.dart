import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/settings.dart';

void main() {
  testWidgets('Settings Widget Rendering Test', (WidgetTester tester) async {
    // Build the Settings widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Settings(category: 'Test Category'),
      ),
    ));

    // Verify that the category field displays the correct value
    expect(find.text('Test Category'), findsOneWidget);

    // Verify that the reminder field displays the correct value
    expect(find.text('6 Months'), findsOneWidget);

    // Verify the presence of the Save Changes button
    expect(find.text('Save Changes'), findsOneWidget);
  });
}
