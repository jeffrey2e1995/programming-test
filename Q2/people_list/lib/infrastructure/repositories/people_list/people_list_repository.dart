import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/data/local/database/tables/person_table.dart';
import 'package:people_list/infrastructure/data/network/api/people_list/people_list_api.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';

class PeopleListRepository {
  PeopleListApi peopleListApi;

  final _table = getIt.get<PersonTable>();

  Future<List<Person>> get peopleList => _table.getPeopleList();

  // constructor
  PeopleListRepository(this.peopleListApi);

  // methods
  Future<List<Person>?> getPeopleList() async {
    return await peopleListApi.getPeopleList();
  }

  Future<void> savePeopleList(List<Person> list) async {
    return await _table.updateAllRecords(list);
  }
}
