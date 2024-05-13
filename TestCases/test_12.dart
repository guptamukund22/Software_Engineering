import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/fridge/items.dart';

void main() {
  testWidgets('items Widget Rendering Test', (WidgetTester tester) async {
    // Create a TestItem with sample data
    final TestItem testItem = TestItem(
      category: 'Test Category',
      item_name: 'Test Item',
      quantity: '5',
      date: '2022-04-16',
    );

    // Build the items widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: testItem,
      ),
    ));

    // Verify that the item name, quantity, and date are displayed
    expect(find.text('Test Item'), findsOneWidget);
    expect(find.text('Quantity : 5'), findsOneWidget);
    expect(find.text('Added to fridge on : 2022-04-16'), findsOneWidget);

    // Verify the presence of Edit and Delete buttons
    expect(find.text('Edit item'), findsOneWidget);
    expect(find.text('Delete item'), findsOneWidget);

    // Verify the initial state of the Chef Desk button
    expect(find.text('Add to Chef Desk'), findsOneWidget);

    // Tap the Chef Desk button and verify the text and icon change
    await tester.tap(find.text('Add to Chef Desk'));
    await tester.pump();

    expect(find.text('Added to Chef Desk'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}

class TestItem extends StatefulWidget {
  final String category;
  final String item_name;
  final String quantity;
  final String date;

  const TestItem({
    Key? key,
    required this.category,
    required this.item_name,
    required this.quantity,
    required this.date,
  }) : super(key: key);

  @override
  State<TestItem> createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  @override
  Widget build(BuildContext context) {
    return items(
      category: widget.category,
      item_name: widget.item_name,
      quantity: widget.quantity,
      date: widget.date,
    );
  }
}
