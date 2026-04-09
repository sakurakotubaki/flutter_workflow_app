import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/repository/hash_key_value_store.dart';
import 'package:flutter_workflow_app/repository/map_key_value_store.dart';

void main() {
  group('MapKeyValueStore', () {
    test('add で追加し get で取得できる', () {
      final store = MapKeyValueStore<String, int>()
        ..add('a', 1)
        ..add('b', 2);

      expect(store.get('a'), 1);
      expect(store.get('b'), 2);
      expect(store.length, 2);
    });

    test('同じキーで add すると上書きされる', () {
      final store = MapKeyValueStore<String, int>()
        ..add('x', 10)
        ..add('x', 99);

      expect(store.get('x'), 99);
      expect(store.length, 1);
    });

    test('remove で削除でき、値が返る', () {
      final store = MapKeyValueStore<String, int>()
        ..add('k', 7);

      expect(store.remove('k'), 7);
      expect(store.get('k'), isNull);
      expect(store.containsKey('k'), isFalse);
    });

    test('存在しないキーの remove は null', () {
      final store = MapKeyValueStore<String, int>();
      expect(store.remove('none'), isNull);
    });
  });

  group('HashKeyValueStore', () {
    test('add / get / remove が動作する', () {
      final store = HashKeyValueStore<int, String>()
        ..add(1, 'one')
        ..add(2, 'two');

      expect(store.get(1), 'one');
      expect(store.remove(1), 'one');
      expect(store.get(1), isNull);
      expect(store.get(2), 'two');
    });

    test('文字列キーでも同様', () {
      final store = HashKeyValueStore<String, bool>()..add('flag', true);

      expect(store.get('flag'), isTrue);
      expect(store.remove('flag'), isTrue);
      expect(store.isEmpty, isTrue);
    });
  });
}
