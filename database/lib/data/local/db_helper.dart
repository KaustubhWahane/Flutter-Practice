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
  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsAffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
    });
    return rowsAffected > 0;
  }

  // Get all notes from the database
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  //  Update a note
  Future<bool> updateNote({
    required int sno,
    required String title,
    required String desc,
  }) async {
    var db = await getDB();
    int rowsAffected = await db.update(
      TABLE_NOTE,
      {COLUMN_NOTE_TITLE: title, COLUMN_NOTE_DESC: desc},
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno],
    );
    return rowsAffected > 0;
  }

  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB();
    int rowsAffected = await db.delete(
      DBHelper.TABLE_NOTE,
      where: "${DBHelper.COLUMN_NOTE_SNO} = ?",
      whereArgs: [sno],
    );
    return rowsAffected > 0;
  }
}
