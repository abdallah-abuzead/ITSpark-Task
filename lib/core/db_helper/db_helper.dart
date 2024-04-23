import 'package:itspark/core/constants/app_strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database? _db;

  Future<Database?> createDatabase() async {
    if (_db != null) return _db;

    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'id_scanner.db');
      // await deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) async {
          //create tables
          await db.execute(
            'CREATE TABLE ${AppStrings.studentsTable}(id VARCHAR(50) PRIMARY KEY,'
            'name VARCHAR(50) NOT NULL,'
            'study_class VARCHAR(50) NOT NULL,'
            'phone VARCHAR(50),'
            'image VARCHAR(255),'
            'address VARCHAR(255) NOT NULL,'
            'notes VARCHAR(255),'
            'date_of_birth VARCHAR(50) NOT NULL)',
          );
        },
      );
      return _db;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> addStudent(Map<String, dynamic> student) async {
    Database? db = await createDatabase();
    return db!.insert(AppStrings.studentsTable, student);
  }

  Future<List> getAllStudents() async {
    Database? db = await createDatabase();
    return db!.query(AppStrings.studentsTable);
  }

  Future<int> updateStudent(Map<String, dynamic> student) async {
    Database? db = await createDatabase();
    return await db!.update(AppStrings.studentsTable, student, where: 'id = ?', whereArgs: [student['id']]);
  }

  Future<int> deleteStudent(String id) async {
    Database? db = await createDatabase();
    return db!.delete(AppStrings.studentsTable, where: 'id = ?', whereArgs: [id]);
  }
}
