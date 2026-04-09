import 'dart:collection' show HashMap;

/// ハッシュテーブル実装の `HashMap` を使ったキー・バリューストア。
///
/// `MapKeyValueStore` と API は同じ。キーの等価性は `==` / `hashCode` に依存する。
/// 走査順は通常の `Map`（挿入順）とは異なり、順序に依存しない用途向け。
class HashKeyValueStore<K, V> {
  HashKeyValueStore() : _map = HashMap<K, V>();

  final HashMap<K, V> _map;

  void add(K key, V value) {
    _map[key] = value;
  }

  V? get(K key) => _map[key];

  V? remove(K key) => _map.remove(key);

  bool containsKey(K key) => _map.containsKey(key);

  int get length => _map.length;

  bool get isEmpty => _map.isEmpty;
}
