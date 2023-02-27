// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:interview_amitruck/main.dart';
import 'package:interview_amitruck/user_interfaces/order_form_page.dart';
import 'package:interview_amitruck/user_interfaces/phone_number_input_page.dart';

void main() {
  group('Welcome page tests', () {
    testWidgets('The first page that appears is the Welcome page',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('Welcome to Amitruck Driver'), findsOneWidget);
// Verify that we have a single button
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets(
        'Tapping on the button navigates to the phone number input page',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();
      expect(
          find.byType(
            PhoneNumberInputPage,
          ),
          findsOneWidget);
    });
  });

  group('Phone number input page tests', () {
    testWidgets('The phone input page shows successfully',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: PhoneNumberInputPage(),
      ));

      // Verify that our counter starts at 0.
      expect(find.text('Enter your phone number to Join Amitruck'),
          findsOneWidget);
// Verify that we have a multiple buttons
      expect(find.byType(MaterialButton), findsWidgets);
    });

    testWidgets(
        'Tapping on the button without input results in a validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(
        home: PhoneNumberInputPage(),
      ));

      await tester.pumpWidget(MaterialApp(
        home: PhoneNumberInputPage(),
      ));
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('field cannot be empty'), findsWidgets);
    });
  });

  group('Order Form tests', () {
    testWidgets('The order form appears as expected',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester
          .pumpWidget(ProviderScope(child: MaterialApp(home: OrderFormPage())));
      expect(find.textContaining('Fill Below To Order'), findsWidgets);
      expect(find.textContaining('Delivery Instructions'), findsWidgets);
      expect(find.textContaining('Pickup point'), findsWidgets);
      expect(find.textContaining('Weight'), findsWidgets);
    });

    testWidgets(
        'Tapping on the button without input results in a validation error',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
          home: OrderFormPage(),
        ),
      ));

      await tester.pumpWidget(MaterialApp(
        home: PhoneNumberInputPage(),
      ));
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('field cannot be empty'), findsWidgets);
    });
  });
}
