import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/widget/button.dart';

void main() {
  testWidgets('ButtonWidget displays title text', (WidgetTester tester) async {
    // Build the ButtonWidget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonWidget(
            titleText: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    // Find the Text widget with the title text
    final titleFinder = find.text('Test Button');

    // Verify that the Text widget exists
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('ButtonWidget calls onPressed when pressed',
      (WidgetTester tester) async {
    // Create a mock function for onPressed
    var pressed = false;
    void onPressed() {
      pressed = true;
    }

    // Build the ButtonWidget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonWidget(
            titleText: 'Test Button',
            onPressed: onPressed,
          ),
        ),
      ),
    );

    // Tap the ButtonWidget
    await tester.tap(find.byType(ElevatedButton));

    // Verify that onPressed was called
    expect(pressed, true);
  });
}
