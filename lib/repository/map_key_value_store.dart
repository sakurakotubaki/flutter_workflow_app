/// 連想配列としてのビジネスロジック（デフォルトは挿入順を保持する [Map]）。
///
/// 追加・取得・削除だけに API を絞り、UI からはこのクラス経由で操作する想定。
class MapKeyValueStore<K, V> {
  // デフォルトコンストラクタ: 挿入順を保持する普通のMapを生成する
  // 他のMap実装（例: HashMap, SplayTreeMap）が必要ならファクトリコンストラクタ等の拡張余地あり
  MapKeyValueStore() : _map = <K, V>{};

  final Map<K, V> _map;

  /// キーに値を紐づける。既存キーなら上書き。
  void add(K key, V value) {
    _map[key] = value;
  }

  /// キーに対応する値。なければ null。
  V? get(K key) => _map[key];

  /// キーを削除し、削除前の値があれば返す。なければ null。
  V? remove(K key) => _map.remove(key);

  bool containsKey(K key) => _map.containsKey(key);

  int get length => _map.length;

  bool get isEmpty => _map.isEmpty;
}
