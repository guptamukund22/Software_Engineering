import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_teller/authentication/login.dart';

void main() {
  testWidgets('Login UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Test if the 'Create Account' and 'Please enter valid details to continue' texts are displayed
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Please enter valid details to continue'), findsOneWidget);

    // Test if the 'Get OTP' button is displayed
    expect(find.text('Get OTP'), findsOneWidget);

    // Test if the username and mail text fields are initially empty
    expect(find.text(''), findsNWidgets(2));

    // Test if the 'Create' button and arrow icon are displayed
    expect(find.text('Create'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  testWidgets('OTP Generation Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Test if tapping 'Get OTP' changes the state
    await tester.tap(find.text('Get OTP'));
    await tester.pump();
    expect(find.text('Enter the OTP'), findsOneWidget);
  });

  testWidgets('Create Account Button Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Simulate tapping on the create account button without entering any details
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // In this test, we're not providing any username or mailid, so we should not navigate
    expect(find.text('Create Account'), findsOneWidget);
  });

  testWidgets('Create Account Test with Valid Details',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Enter valid username and mailid
    await tester.enterText(find.byType(TextField).first, 'Test Username');
    await tester.enterText(find.byType(TextField).last, 'test@example.com');

    // Tap on 'Create' button
    await tester.tap(find.text('Create'));
    await tester.pump();

    // Assuming 'addUser' returns true and navigation occurs on success
    expect(find.text('Create Account'),
        findsNothing); // No longer on the login screen
  });

  testWidgets('Create Account Test with Invalid Details',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));

    // Enter username but leave mailid field empty
    await tester.enterText(find.byType(TextField).first, 'Test Username');

    // Tap on 'Create' button
    await tester.tap(find.text('Create'));
    await tester.pump();

    // Since mailid is empty, navigation should not occur
    expect(find.text('Create Account'),
        findsOneWidget); // Still on the login screen
  });

  // You can write more tests to cover other scenarios such as wrong OTP, etc.
}
