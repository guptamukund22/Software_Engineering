import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/add_item.dart';

void main() {
  testWidgets('AddItem UI Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: AddItem(category: 'Test Category')));

    // Verify if the app bar title is displayed correctly
    expect(find.text('Add item to Test Category'), findsOneWidget);

    // Verify if the text fields are displayed correctly
    expect(find.byType(TextField), findsNWidgets(3));

    // Verify if the 'Add item' button is displayed correctly
    expect(find.text('Add item'), findsOneWidget);
  });

  testWidgets('AddItem Add Functionality Test', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: AddItem(category: 'Test Category')));

    // Entering text into the item name text field
    await tester.enterText(find.byType(TextField).at(0), 'Test Item');

    // Entering text into the quantity text field
    await tester.enterText(find.byType(TextField).at(1), '2');

    // Entering text into the date text field
    await tester.enterText(find.byType(TextField).at(2), '01/01/2024');

    // Tapping on the 'Add item' button
    await tester.tap(find.text('Add item'));
    await tester.pump();

    // Verify if the AddItem function was called correctly and item was added
    // Use the appropriate assertions based on your implementation
  });
}
