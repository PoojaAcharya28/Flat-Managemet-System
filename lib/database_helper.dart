//import 'dart:ffi';

import 'package:sqflite/sqflite.dart' as sql;

import 'modules/Maintaince/calculation_modal.dart';
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

    // creating calculation table
    await database.execute("""
        CREATE TABLE calculations(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cname TEXT,
          cfloor TEXT,
          cflat TEXT,
          c_com_area_unit INTEGER,
          c_unit_area_unit INTEGER,
          amt_paid INTEGER,
          status TEXT,
          time TEXT
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

  static Future<List<Resident>> getResidents() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('residents');

    return List.generate(maps.length, (i) {
      return Resident(
        id: maps[i]['id'],
        fname: maps[i]['fname'],
        lname: maps[i]['lname'],
        email: maps[i]['email'],
        contact: maps[i]['contact'],
        wcontact: maps[i]['wcontact'],
        home: maps[i]['home'],
        adhaar: maps[i]['adhaar'],
        floor: maps[i]['floor'],
        flat: maps[i]['flat'],
        no_people: maps[i]['no_people'],
      );
    });
  }

  static Future<Resident> getResident(int id) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('residents', where: 'id = ?', whereArgs: [id]);
    return Resident.fromMap(maps.first);
  }

  static Future<int> updateResident(int id, Resident resident) async {
    final dbClient = await db();
    return dbClient.update(
      'residents',
      resident.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteResident(int id) async {
    final dbClient = await db();
    return await dbClient.delete(
      'residents',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//..............................................................................................................
  static Future<List<Map<String, dynamic>>> rawQuery(
      String query, List<String> list) async {
    final dbClient = await db();
    print(db());
    //------------------------------did not pass the parameters ------------------------------------------
    return dbClient.rawQuery(query, list);
  }

  //........................................next functions..........

  static Future<int> addCalculation(Calculation calculation) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('calculations', calculation.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Calculation>> getCalculations() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('calculations');

    return List.generate(maps.length, (i) {
      return Calculation(
        id: maps[i]['id'],
        cname: maps[i]['cname'],
        cfloor: maps[i]['cfloor'],
        cflat: maps[i]['cflat'],
        c_com_area_unit: maps[i]['c_com_area_unit'],
        c_unit_area_unit: maps[i]['c_unit_area_unit'],
        amt_paid: maps[i]['amt_paid'],
        status: maps[i]['status'],
        time: maps[i]['time'],  
      );
    });
  }

  static Future<Calculation> getCalculation(int id) async {
    //fetching data through id of table user
    final dbClient = await db();
    final maps =
        await dbClient.query('calculations', where: 'id = ?', whereArgs: [id]);
    return Calculation.fromMap(maps.first);
  }

  static Future<int> updateCalculation(int id, Calculation calculation) async {
    final dbClient = await db();
    return dbClient.update(
      'calculations',
      calculation.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteCalculation(int id) async {
    final dbClient = await db();
    return await dbClient.delete(
      'calculations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

// static Future<List<Map<String, dynamic>>> rawQuery(String query, [List<dynamic> args = const []]) async {
//     final dbClient = await db();
//     return db.rawQuery(query);
//   }
}
