import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workflow_app/repository/note_sqlite_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// SQLite は通常モバイル向けのため、VM 上のテストでは `sqflite_common_ffi` で
/// ネイティブ SQLite を使う（`setUpAll` で初期化が必要）。
void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('NoteSqliteRepository', () {
    late Database db;
    late NoteSqliteRepository repo;

    setUp(() async {
      db = await openDatabase(inMemoryDatabasePath);
      repo = await NoteSqliteRepository.open(db);
    });

    tearDown(() async {
      await repo.close();
    });

    test('insert した本文が allBodies で順に取れる', () async {
      await repo.insertBody('first');
      await repo.insertBody('second');

      expect(await repo.allBodies(), <String>['first', 'second']);
    });

    test('空のときは空リスト', () async {
      expect(await repo.allBodies(), isEmpty);
    });
  });
}
