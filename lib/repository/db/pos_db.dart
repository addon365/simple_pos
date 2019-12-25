import 'dart:io';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class PosDB {
  Future<bool> createDatabase() async {
    const dbName = "pos_db.db";
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    try {
      await Directory(path).create(recursive: true);
    } catch (_) {
      return false;
    }
    return true;
  }
}
