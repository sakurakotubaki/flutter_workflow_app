import 'package:sqflite/sqflite.dart';

/// メモ一行を SQLite に保存するリポジトリ（I/O 境界）。
///
/// [Database] は呼び出し側で [openDatabase] したものを渡す。
/// ユニットテストでは `sqflite_common_ffi` + メモリ DB が使いやすい。
class NoteSqliteRepository {
  NoteSqliteRepository._(this._db);

  final Database _db;

  static const _table = 'notes';

  /// テーブルを作成してから利用可能にする。
  static Future<NoteSqliteRepository> open(Database database) async {
    await database.execute('''
CREATE TABLE IF NOT EXISTS $_table (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  body TEXT NOT NULL
)
''');
    return NoteSqliteRepository._(database);
  }

  /// 新規行を追加し、SQLite が割り当てた row id を返す。
  Future<int> insertBody(String body) async {
    return _db.insert(_table, <String, Object?>{'body': body});
  }

  /// id 昇順で本文だけを列挙する。
  Future<List<String>> allBodies() async {
    final rows = await _db.query(
      _table,
      columns: ['body'],
      orderBy: 'id ASC',
    );
    return rows.map((row) => row['body']! as String).toList();
  }

  Future<void> close() => _db.close();
}
