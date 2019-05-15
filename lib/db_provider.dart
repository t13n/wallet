import 'dart:io';
import 'dart:async';
import 'package:offwallet/credit_card_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }
  
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "wallet.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Cards ("
          "id INTEGER PRIMARY KEY,"
          "card_name TEXT,"
          "start_code TEXT,"
          "end_code TEXT,"
          "expire TEXT,"
          "card_color TEXT,"
          "text_color TEXT"
          ")"
        );
    });
  }

  newCard(CreditCardModel newCard) async {
    final db = await database;
    var res = await db.insert("Cards", newCard.toJson());
    return res;
  }

  Future<List<CreditCardModel>> getAllCards() async {
    final db = await database;
    var res = await db.query("Cards");
    List<CreditCardModel> list =
        res.isNotEmpty ? res.map((c) => CreditCardModel.fromJson(c)).toList() : [];
    return list;
  }
}