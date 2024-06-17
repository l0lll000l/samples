import 'dart:ui';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List WholeList = [];

class LocalDataBase {
  Database? _database;

  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDb('Local.db');
    return _database;
  }

  Future _initializeDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''

CREATE TABLE Localdata(id INTEGER PRIMARY KEY,Name TEXT NOT NULL)
''');
  }

//------------------------------------------------------ add data to db
  Future addDataLocally({name}) async {
    final db = await database;
    await db.insert('localdata', {'Name': name});
    print('${name} added successfully  ');

    return 'added';
  }

  //------------------------------------------------------- read data from db
  Future readAllData() async {
    final db = await database;
    final allData = await db!.query('localdata');
    WholeList = allData;

    return 'successfully read';
  }

  //-------------------------------------------------------- update db
  Future upadateData({name, id}) async {
    final db = await database;
    int dbUpdateId = await db
        .rawUpdate('UPDATE localdata SET Name=? WHERE id=?', [name, id]);

    return dbUpdateId;
  }

  Future deleteData({id}) async {
    final db = await database;
    await db.delete('localdata', where: 'id=?', whereArgs: [id]);

    print('deleted successfully $id');
  }
}
