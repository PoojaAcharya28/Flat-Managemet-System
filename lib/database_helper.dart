//import 'dart:ffi';

import 'package:sqflite/sqflite.dart' as sql;

import 'modules/Resident/resident_modal.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {

    // creating residents table
    await database.execute("""
        CREATE TABLE residents(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          fname TEXT,
          lname TEXT,
          email TEXT,
          contact INTEGER,
          wcontact INTEGER,
          home TEXT,
          adhaar INTEGER,
          floor TEXT,
          flat TEXT,
          no_people INTEGER
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

  //  static Future<int> createItem(String? fname, String? lname, String? email, int? contact, int? wcontact, String? home, int? adhaar, int? floor, int? flat, int? no_people ) async {
  //   final db = await DatabaseHelper.db();

  //   final data = {'fname': fname, 'lname': lname, 'email' : email, 'contact':contact, 'wcontact':wcontact, 'home':home, 'adhaar':adhaar, 'floor':floor, 'flat':flat, 'no_people':no_people  };
  //   final id = await db.insert('residents', data,
  //       conflictAlgorithm: sql.ConflictAlgorithm.replace);
  //   return id;

  // }


  static Future<int> addResident(Resident resident) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('residents', resident.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }



















}
