/// LIFO（後入れ先出し）のスタックを [List] で実装したもの。
///
/// ビジネスロジックは「どこに追加・削除するか」だけに閉じ、UI や DB には依存しない。
class StackCollection<T> {
  final List<T> _items = [];

  /// 先頭が底、末尾がトップ。末尾に積む。
  void push(T value) {
    _items.add(value);
  }

  /// トップを取り除いて返す。空なら null。
  T? pop() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeLast();
  }

  /// 取り除かずにトップを参照。空なら null。
  T? peek() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.last;
  }

  int get length => _items.length;

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;
}
