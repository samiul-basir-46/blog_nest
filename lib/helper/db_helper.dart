import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  DBHelper._init();

  static Database? _database;

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB("blogs.db");
    return _database!;
  }

  Future<Database> _initDB (String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE bookmarks (id INTEGER PRIMARY KEY,
      title TEXT,
      image TEXT,
      excerpt TEXT,
      categories TEXT
      )
      
      '''
    );
  }

}