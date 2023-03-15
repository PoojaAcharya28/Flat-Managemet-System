//import 'dart:ffi';

import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {


  static Future<void> createTables(sql.Database database) async {

    await database.execute("""CREATE TABLE residents(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        fname TEXT,
        lname TEXT,
        email TEXT,
        contact NUMERIC,
        wcontact NUMERIC,
        home TEXT,
        adhaar NUMERIC,
        floor TEXT UNIQUE,
        flat TEXT UNIQUE,
        no_people TEXT,
        



      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'flat.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }



   static Future<int> createItem(String? fname, String? lname, String? email, int? contact, int? wcontact, String? home, int? adhaar, int? floor, int? flat, int? no_people ) async {
    final db = await DatabaseHelper.db();

    final data = {'fname': fname, 'lname': lname, 'email' : email, 'contact':contact, 'wcontact':wcontact, 'home':home, 'adhaar':adhaar, 'floor':floor, 'flat':flat, 'no_people':no_people  };
    final id = await db.insert('residents', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  } 












}




