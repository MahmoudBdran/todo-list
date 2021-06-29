import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_list/Model.dart';

class DatabaseHelper{
  static final DBName ="MyListt.db";
  static final DBVersion =1;
  static final DBTable ="mytaskss";
  static final col_id ="_id";
  static final col_title ="_title";
  static final col_icon_color ="_icon_color";
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance =DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database>get database async{
    if(_database !=null){
      return _database;

    }else{
      _database=await _initDatabase();
      return _database;

    }
  }
  _initDatabase() async{
    Directory dir =await getApplicationDocumentsDirectory();
    String path =join(dir.path,DBName);
    return await openDatabase(path,version: DBVersion,onCreate: _onCreate);
  }
  _onCreate(Database db ,int version)async{
    await db.execute('''
          CREATE TABLE $DBTable (
            $col_id INTEGER PRIMARY KEY AUTOINCREMENT,
            $col_title TEXT NOT NULL,
            $col_icon_color TEXT NOT NULL
          )
          ''');
  }

  //insert
  Future<int> insert(Map<String ,dynamic> row)async{
    Database db =await instance.database;
    return await db.insert(DBTable, row);
  }
  //query all rows

  Future<List<Model>> queryAllRows() async{
    Database  db =await this.database;
    var res=  await db.query(DBTable);
    List<Model> list =res.isNotEmpty?res.map((e) => Model.fromMap(e)).toList():null;
    return list;
  }
  //delete
  Future<int> delete(String title)async{
    Database db= await this.database;
    return await db.delete(DBTable,where: "$col_title = ?",whereArgs: [title]);

  }

  /*
  Future<List<Fruits>> getAllFruits() async {
    var dbClient = await con.db;
    var res = await dbClient.query("fruits");

    List<Fruits> list =
        res.isNotEmpty ? res.map((c) => Fruits.fromMap(c)).toList() : null;
    return list;
  }
   */
}