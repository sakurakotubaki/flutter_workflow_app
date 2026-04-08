import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/presentation/counter/counter_text.dart';

void main() {
  group('CounterText', () {
    testWidgets('displays 0 when value is 0', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CounterText(value: 0)),
        ),
      );
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('displays 1 when value is 1', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CounterText(value: 1)),
        ),
      );
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('displays multi-digit value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CounterText(value: 42)),
        ),
      );
      expect(find.text('42'), findsOneWidget);
    });
  });
}
