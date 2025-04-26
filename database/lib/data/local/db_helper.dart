import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelper {
  // Singleton pattern
  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static final String TABLE_NOTE = "note";
  static final String COLUMN_NOTE_SNO = "sno";
  static final String COLUMN_NOTE_TITLE = "title";
  static final String COLUMN_NOTE_DESC = "description";

  Database? myDB;

  // Open or create the database
  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await openDB();
      return myDB!;
    }
  }

  // Method to open the database
  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, 'noteDB.db');

    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $TABLE_NOTE($COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_NOTE_TITLE TEXT, $COLUMN_NOTE_DESC TEXT)",
        );
      },
      version: 1,
    );
  }

  // Add a note to the database
  Future<bool> addNote({
    required String title,
    required String description,
  }) async {
    var db = await getDB();
    int rowsAffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: title,
      COLUMN_NOTE_DESC: description,
    });
    return rowsAffected > 0;
  }

  // Reading the data
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    // Select * from the table
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);

    return mData;
  }
}
