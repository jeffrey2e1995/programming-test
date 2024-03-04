import 'package:people_list/infrastructure/data/network/api/api_response_model.dart';
import 'package:people_list/infrastructure/data/network/api/people_list/people_list_api.dart';

class PeopleListRepository {
  PeopleListApi peopleListApi;

  // constructor
  PeopleListRepository(this.peopleListApi);

  // methods
  Future<ApiStringResponse?> getPeopleList() async {
    return await peopleListApi.getPeopleList();
  }

  // methods
  // ProjectInfo get projectInfo => _sharedPrefsHelper.projectInfo;

  // Future<bool> saveProjectInfo(ProjectInfo info) async {
  //   return await _sharedPrefsHelper.saveProjectInfo(info);
  // }

  // Future<bool> removeProjectInfo() async {
  //   return await _sharedPrefsHelper.removeProjectInfo();
  // }
}
