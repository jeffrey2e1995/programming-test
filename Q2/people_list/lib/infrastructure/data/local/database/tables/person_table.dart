import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/data/local/database/database.dart';
import 'package:sqflite/sqflite.dart';

class PersonTable {
  static const String TABLE_NAME = 'PersonTable';

  Future<List<Person>> getPeopleList() async {
    final Database db = await AppDatabase.getInstance();

    final List<Map<String, dynamic>> peopleInMaps = await db.query(
      TABLE_NAME,
    );

    List<Person> peopleList = [];

    for (int i = 0; i < peopleInMaps.length; i++) {
      peopleList.add(
        Person.fromJson(
          {
            Person.idKey: peopleInMaps[i][Person.idKey],
            Person.nameKey: {
              Name.lastKey: peopleInMaps[i][Name.lastKey],
              Name.firstKey: peopleInMaps[i][Name.firstKey],
            },
            Person.emailKey: peopleInMaps[i][Person.emailKey],
            Person.pictureKey: peopleInMaps[i][Person.pictureKey],
            Person.locationKey: {
              Location.latitudeKey: peopleInMaps[i][Location.latitudeKey],
              Location.longitudeKey: peopleInMaps[i][Location.longitudeKey],
            },
          },
        ),
      );
    }
    return peopleList;
  }

  Future<void> updateAllRecords(List<Person> peopleList) async {
    final Database db = await AppDatabase.getInstance();

    // remove all records
    await db.delete(TABLE_NAME);

    // insert records
    await db.transaction((txn) async {
      for (Person person in peopleList) {
        await txn.insert(TABLE_NAME, person.toMap());
      }
    });
  }
}
