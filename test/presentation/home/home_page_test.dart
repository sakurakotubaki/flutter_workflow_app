import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/presentation/home/home_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('ElevatedButton のタップでメッセージが更新される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      expect(find.text('ボタンをタップ'), findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, 'Tap'));
      await tester.pump();

      expect(find.text('ElevatedButton がタップされた'), findsOneWidget);
    });

    /// [IconButton] と [ElevatedButton] のテスト上の違い（概要）:
    ///
    /// - **ElevatedButton**: ラベルが [Text] なら
    ///   `find.widgetWithText(ElevatedButton, 'Tap')` や
    ///   `find.text('Tap')` で特定しやすい。
    /// - **IconButton**: 子は [Icon] のみのことが多く、文言がない。
    ///   `find.byType(IconButton)` や `find.byIcon(Icons.menu_open)` で探すのが一般的。
    ///   [IconButton] が期待する必須は [icon]。[onPressed] が null だと無効化される。
    testWidgets('IconButton のタップでメッセージが更新される', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      await tester.tap(find.byIcon(Icons.menu_open));
      await tester.pump();

      expect(find.text('IconButton（メニュー）がタップされた'), findsOneWidget);
    });

    testWidgets('IconButton は find.byType でもタップできる', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: HomePage()),
      );

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(find.text('IconButton（メニュー）がタップされた'), findsOneWidget);
    });
  });
}
