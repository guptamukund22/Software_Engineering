import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/fridge.dart';

void main() {
  testWidgets('Fridge Widget Rendering Test', (WidgetTester tester) async {
    // Build the Fridge widget
    await tester.pumpWidget(MaterialApp(
      home: Fridge(),
    ));

    // Verify that "My Fridge" text is displayed
    expect(find.text('My Fridge'), findsOneWidget);

    // Verify the presence of category cards
    expect(find.byType(CategoryCard),
        findsNWidgets(6)); // Assuming 6 categories are displayed

    // Verify the text of each category card
    expect(find.text('Frozens'), findsOneWidget);
    expect(find.text('Dairy'), findsOneWidget);
    expect(find.text('Fruits'), findsOneWidget);
    expect(find.text('Vegetables'), findsOneWidget);
    expect(find.text('Cooked Food'), findsOneWidget);
    expect(find.text('Other Groceries'), findsOneWidget);
  });
}
