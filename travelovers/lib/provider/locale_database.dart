// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:io';
import 'package:travelovers/models/User.dart';
import 'package:travelovers/models/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// import '../model/notes.dart';
// import '../model/note.dart';

class LocalDatabase {
  // Atributo que irá afunilar todas as consultas
  static LocalDatabase helper = LocalDatabase._createInstance();

  // Construtor privado
  LocalDatabase._createInstance();

  // Objeto do SQFLite para fazer as requisições.
  static Database? _database;

  // Configuração do banco: nomes de tabelas.
  String userTable = "user";
  String colId = "id"; // Auto-numerar
  String colEmail = "email";
  String colName = "name";
  String colPwd = "password";
  String colTel = "phone";

  String localeTable = "locale";
  String colTitle = "title";
  String colSubject = "subject";
  String colDescription = "description";
  String colAddress = "address";
  String colImage = "image";


  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  // Gerar um arquivo e depois aplicar uma função que gera um banco de dados nesse arquivo.
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}travelover.db";
    return openDatabase(path, version: 2, onCreate: _createDb);
  }

  _createDb(Database db, int newVersion) async {
    await db.execute('''
       CREATE TABLE $userTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colEmail TEXT,
           $colName TEXT,
           $colPwd TEXT,
           $colTel TEXT
          );
    ''');
    await db.execute('''
       CREATE TABLE $localeTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colTitle TEXT,
           $colSubject TEXT,
           $colDescription TEXT,
           $colAddress TEXT,
           $colImage BLOB
          );
    ''');
  }

  Future<int> insertUser(User user) async {
    Database? db = await database;
    int result = await db.insert(userTable, user.toMap());
    return result;
  }

  Future<int> updateUser(String userId, User user) async {
    Database db = await database;
    int result = await db.update(userTable, user.toMap(),
        where: "$colId = ?", whereArgs: [userId]);
    return result;
  }

  Future<Map?> getUser(String email, String pwd) async {
    Database db = await database;

    List<Map<String, Object?>> userList =
        await db.rawQuery("SELECT * FROM $userTable where $colEmail = '$email' and $colPwd = '$pwd';");

    if (userList.isEmpty) return null;

    return userList[0];
  }

  Future<int> insertLocale(Location locale) async {
    Database? db = await database;
    int result = await db.insert(localeTable, locale.toMap());
    locale.id = result;
    notify(result, locale);
    return result;
  }

  Future<int> deleteLocale(int id) async {
    Database? db = await database;
    int result = await db.delete(localeTable, where: "$colId = ?", whereArgs: [id]);
    notify(id, null);
    return result;
  }
  
  Future<List<Location>> getLocales() async {
    Database db = await database;

    List<Map<String, Object?>> localeList =
        await db.rawQuery("SELECT * FROM $localeTable;");

    List<Location> list = [];
    for (int i = 0; i < localeList.length; i++) {
      Location locale = Location.fromMap(localeList[i]);

      list.add(locale);
    }
    return list;
  }

  /*
     Parte da STREAM
  */
  notify(int localeId, Location? locale) async {
    _controller?.sink.add([localeId, locale]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }

  dispose() {
    if (_controller != null) {
      if (!_controller!.hasListener) {
        _controller!.close();
        _controller = null;
      }
    }
  }

  static StreamController? _controller;
}