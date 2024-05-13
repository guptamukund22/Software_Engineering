import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/contact_us/know_more.dart';

void main() {
  group('know_more Widget Test', () {
    testWidgets('Widget UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: know_more()));

      // Test if the 'About us' text is displayed
      expect(find.text('About us'), findsOneWidget);

      // Test if the 'Hello Users!' text is displayed
      expect(find.text('Hello Users!'), findsOneWidget);

      // Test if the 'User Policies' text is displayed
      expect(find.text('User Policies'), findsOneWidget);

      // Test if the 'Click on this to see our policies' text is displayed
      expect(find.text('Click on this to see our policies'), findsOneWidget);

      // Test if CarouselSlider is present
      expect(find.byType(CarouselSlider), findsOneWidget);

      // Test if DotsIndicator is present
      expect(find.byType(DotsIndicator), findsOneWidget);
    });
  });

  group('member Widget Test', () {
    testWidgets('Widget UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: member(
          designation: 'Developer',
          mailid: 'test@example.com',
          github: 'https://github.com/example',
          instagram: 'https://instagram.com/example',
          name: 'John Doe',
          position: 'B.Tech 2nd year',
        ),
      ));

      // Test if the member's name is displayed
      expect(find.text('John Doe'), findsOneWidget);

      // Test if the designation is displayed
      expect(find.text('Role: Developer'), findsOneWidget);

      // Test if the position is displayed
      expect(find.text('Currently: B.Tech 2nd year'), findsOneWidget);

      // Test if the email icon is present
      expect(find.byIcon(Icons.mail_outline), findsOneWidget);

      // Test if the GitHub icon is present
      expect(find.byAsset('assets/images/github.png'), findsOneWidget);

      // Test if the Instagram icon is present
      expect(find.byAsset('assets/images/instagram.png'), findsOneWidget);
    });
  });
}
