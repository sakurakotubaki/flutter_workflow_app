/// FIFO（先入れ先出し）のキューを [List] で実装したもの。
///
/// 先頭 [dequeue] は `removeAt(0)` のため要素数に比例してコストが増える。
/// 本番で高頻度なら `dart:collection` の `Queue` 利用を検討する。
class FifoQueue<T> {
  final List<T> _items = [];

  /// 末尾に追加する。
  void enqueue(T value) {
    _items.add(value);
  }

  /// 先頭を取り除いて返す。空なら null。
  T? dequeue() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeAt(0);
  }

  /// 先頭を参照のみ。空なら null。
  T? peek() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.first;
  }

  int get length => _items.length;

  bool get isEmpty => _items.isEmpty;
}
