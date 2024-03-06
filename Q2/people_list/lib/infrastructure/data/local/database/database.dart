import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/data/local/tables/person_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static late Database? database;

  static Future<Database> getInstance() async {
    if (database == null) {
      await AppDatabase.initDatabase();
    }

    return database!;
  }

  static const List<String> initialScripts = [
    '''CREATE TABLE IF NOT EXISTS ${PersonTable.TABLE_NAME}(
          ${Person.idKey} TEXT PRIMARY KEY,
          ${Name.lastKey} TEXT NULL,
          ${Name.firstKey} TEXT NULL,
          ${Person.emailKey} TEXT NULL, 
          ${Person.pictureKey} TEXT NULL, 
          ${Location.latitudeKey} REAL NULL,
          ${Location.longitudeKey} REAL NULL
      )''',
  ];

  static Map<int, List<String>> migrationScripts = {
    // Starts from Version 2, 1 is initial
  };

  static Future<void> initDatabase() async {
    database = await openDatabase(
        join(await getDatabasesPath(), 'people_list_database.db'),
        onCreate: (db, version) async {
          for (String script in initialScripts) {
            await db.execute(script);
          }

          for (List<String> sqlList in migrationScripts.values) {
            for (String sqlText in sqlList) {
              await db.execute(sqlText);
            }
          }
        },
        version: migrationScripts.length + 1,
        onUpgrade: ((db, oldVersion, newVersion) async {
          for (int i = oldVersion; i < newVersion; i++) {
            for (String sqlText in migrationScripts[i + 1]!) {
              await db.execute(sqlText);
            }
          }
        }));
  }
}
