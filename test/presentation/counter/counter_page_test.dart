import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/presentation/counter/counter_page.dart';

void main() {
  group('CounterPage', () {
    testWidgets('shows 0 initially', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: CounterPage()),
      );
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('increments counter when FAB is tapped', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: CounterPage()),
      );
      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
