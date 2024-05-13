import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_teller/fridge/camera.dart';
import 'package:recipe_teller/fridge/category_card.dart';
import 'package:recipe_teller/fridge/items_api.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('CategoryCard Widget Test', () {
    late CategoryCard categoryCardWidget;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      categoryCardWidget = const CategoryCard(category: 'Test Category');
      mockNavigatorObserver = MockNavigatorObserver();
    });

    testWidgets('CategoryCard UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: categoryCardWidget),
        navigatorObservers: [mockNavigatorObserver],
      ));

      // Verify if the category name is displayed correctly
      expect(find.text('Test Category'), findsOneWidget);

      // Verify if the add button is displayed correctly
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('CategoryCard Navigation Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: categoryCardWidget),
        navigatorObservers: [mockNavigatorObserver],
      ));

      // Tap on the add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify if the correct navigation is triggered
      verify(mockNavigatorObserver.didPush(any, any));
      expect(find.byType(TakePicture), findsOneWidget);
    });
  });

  group('Category_Card Widget Test', () {
    late Category_Card categoryCardWidget;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      categoryCardWidget = const Category_Card(category: 'Test Category');
      mockNavigatorObserver = MockNavigatorObserver();
    });

    testWidgets('Category_Card UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: categoryCardWidget),
        navigatorObservers: [mockNavigatorObserver],
      ));

      // Verify if the category name is displayed correctly
      expect(find.text('Test Category'), findsOneWidget);

      // Verify if the "Add item" button is displayed correctly
      expect(find.text('Add item'), findsOneWidget);
    });

    testWidgets('Category_Card Navigation Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: categoryCardWidget),
        navigatorObservers: [mockNavigatorObserver],
      ));

      // Tap on the "Add item" button
      await tester.tap(find.text('Add item'));
      await tester.pumpAndSettle();

      // Verify if the correct navigation is triggered
      verify(mockNavigatorObserver.didPush(any, any));
      expect(find.byType(TakePicture), findsOneWidget);
    });
  });
}
