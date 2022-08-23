import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Singleton {
  static final Singleton _instance = Singleton.internal();
  Singleton.internal();
  factory Singleton() => _instance;

  Database? database;

  initDB() async {
    String path = join(await getDatabasesPath(), "empdet.db");
    database =  await openDatabase(path, version: 10, 
    onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE sync_table(sync_id INTEGER PRIMARY KEY AUTOINCREMENT, sync_data TEXT)");
      await db.execute(
          "CREATE TABLE picture_table(picture_id INTEGER PRIMARY KEY AUTOINCREMENT, picture_url TEXT,picture BLOB)");
    });
  }

  Future<List<Map<String, Object?>>> isDbEmpty() async {
    var data = await database!.rawQuery('SELECT * FROM sync_table');
    return data;
  }

  Future<Uint8List> getImage(String url) async {
    var data = await database!.rawQuery('SELECT picture FROM picture_table where picture_url = "$url"');
    return data[0]["picture"] as Uint8List;
  }

  Future<void> insertSyncData(String data)async{
    await database!.insert("sync_table", {
      "sync_data" : data
    });
  }

  Future<void> insertPictureData(String url,Uint8List data)async{
    await database!.insert("picture_table", {
      "picture_url" : url,
      "picture" : data
    });
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

}
