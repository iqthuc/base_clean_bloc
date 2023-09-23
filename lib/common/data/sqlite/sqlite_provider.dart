import 'package:base_clean_bloc/common/index.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteProvider {
  SQLiteProvider._();
  static final SQLiteProvider db = SQLiteProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, SQLiteConfig.dbName);
    return await openDatabase(
      path,
      version: SQLiteConfig.dbVersion,
    );
  }

  Future closeDB() async {
    await _database?.close();
  }

  Future<void> execute({required String sql}) async {
    await _database?.transaction((txn) async {
      await txn.execute(sql);
    });
  }

  Future<List<Map<String, Object?>>> rawQuery({required String sql}) async {
    await _database?.transaction((txn) async {
      return await txn.rawQuery(sql);
    });
    return [];
  }
}
