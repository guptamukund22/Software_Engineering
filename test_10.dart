import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/edit_item.dart';
import 'package:recipe_teller/fridge/items.dart';

void main() {
  // Test widget rendering
  testWidgets('EditItem UI Test', (WidgetTester tester) async {
    // Create a test item
    final testItem = items(
      id: 1,
      category: 'Test Category',
      item_name: 'Test Item',
      quantity: '2',
      date: '2022-04-15',
    );

    // Build the EditItem widget
    await tester.pumpWidget(MaterialApp(
      home: EditItem(item: testItem),
    ));

    // Verify that the item details are correctly displayed in the text fields
    expect(find.text('Test Item'), findsOneWidget); // Item name
    expect(find.text('2'), findsOneWidget); // Quantity
    expect(find.text('Date of Entry'), findsOneWidget); // Date label
    expect(find.text('2022-04-15'), findsOneWidget); // Date value

    // Verify the presence of the "Save item" button
    expect(find.text('Save item'), findsOneWidget);
  });

  // Test item editing functionality
  testWidgets('EditItem Functionality Test', (WidgetTester tester) async {
    // Mock ItemProvider to return successful editing
    ItemProviderMock itemProviderMock = ItemProviderMock();
    when(itemProviderMock.editItem(any, any)).thenAnswer((_) async => true);

    // Create a test item
    final testItem = items(
      id: 1,
      category: 'Test Category',
      item_name: 'Test Item',
      quantity: '2',
      date: '2022-04-15',
    );

    // Build the EditItem widget
    await tester.pumpWidget(MaterialApp(
      home: EditItem(item: testItem),
    ));

    // Simulate entering new values in the text fields
    await tester.enterText(find.byKey(ValueKey('item_name')), 'Updated Item');
    await tester.enterText(find.byKey(ValueKey('quantity')), '3');
    await tester.enterText(find.byKey(ValueKey('date')), '2022-04-16');

    // Tap the "Save item" button
    await tester.tap(find.text('Save item'));
    await tester.pump();

    // Verify that the item editing process is triggered
    verify(itemProviderMock.editItem(testItem, any)).called(1);
  });
}

// Mock class for ItemProvider
class ItemProviderMock extends Mock implements ItemProvider {}
