import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/delete_item.dart';
import 'package:recipe_teller/fridge/items.dart';

void main() {
  // Test widget rendering
  testWidgets('DeleteItem UI Test', (WidgetTester tester) async {
    // Create a test item
    final testItem = items(
      id: 1,
      category: 'Test Category',
      item_name: 'Test Item',
      quantity: '2',
      date: '2022-04-15',
    );

    // Build the DeleteItem widget
    await tester.pumpWidget(MaterialApp(
      home: DeleteItem(item: testItem),
    ));

    // Verify that the item details are displayed
    expect(find.text('Item Name: Test Item'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Date of Entry: 2022-04-15'), findsOneWidget);

    // Verify the presence of the "Delete item" button
    expect(find.text('Delete item'), findsOneWidget);
  });

  // Test item deletion functionality
  testWidgets('DeleteItem Functionality Test', (WidgetTester tester) async {
    // Mock ItemProvider to return successful deletion
    ItemProviderMock itemProviderMock = ItemProviderMock();
    when(itemProviderMock.deleteItem(any)).thenAnswer((_) async => true);

    // Create a test item
    final testItem = items(
      id: 1,
      category: 'Test Category',
      item_name: 'Test Item',
      quantity: '2',
      date: '2022-04-15',
    );

    // Build the DeleteItem widget
    await tester.pumpWidget(MaterialApp(
      home: DeleteItem(item: testItem),
    ));

    // Tap the "Delete item" button
    await tester.tap(find.text('Delete item'));
    await tester.pump();

    // Verify that the item deletion process is triggered
    verify(itemProviderMock.deleteItem(testItem)).called(1);
  });
}

// Mock class for ItemProvider
class ItemProviderMock extends Mock implements ItemProvider {}
