import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/repository/fifo_queue.dart';
import 'package:flutter_workflow_app/repository/stack_collection.dart';

/// 純粋なビジネスロジック（メモリ上のデータ構造）のユニットテスト。
///
/// - **Arrange**: 対象クラスを生成し、必要なら push/enqueue。
/// - **Act**: pop / dequeue など。
/// - **Assert**: [expect] で戻り値・状態を検証。
void main() {
  group('StackCollection', () {
    test('push した順と逆に pop する（LIFO）', () {
      final stack = StackCollection<int>()
        ..push(1)
        ..push(2)
        ..push(3);

      expect(stack.pop(), 3);
      expect(stack.pop(), 2);
      expect(stack.pop(), 1);
      expect(stack.pop(), isNull);
      expect(stack.isEmpty, isTrue);
    });

    test('peek は末尾を返しつつ要素を残す', () {
      final stack = StackCollection<String>()..push('a');
      expect(stack.peek(), 'a');
      expect(stack.length, 1);
      expect(stack.pop(), 'a');
    });

    test('空のスタックで pop / peek は null', () {
      final stack = StackCollection<int>();
      expect(stack.pop(), isNull);
      expect(stack.peek(), isNull);
    });
  });

  group('FifoQueue', () {
    test('enqueue した順に dequeue する（FIFO）', () {
      final q = FifoQueue<int>()
        ..enqueue(10)
        ..enqueue(20)
        ..enqueue(30);

      expect(q.dequeue(), 10);
      expect(q.dequeue(), 20);
      expect(q.dequeue(), 30);
      expect(q.dequeue(), isNull);
    });

    test('peek は先頭だけ見る', () {
      final q = FifoQueue<String>()
        ..enqueue('x')
        ..enqueue('y');
      expect(q.peek(), 'x');
      expect(q.length, 2);
    });
  });
}
