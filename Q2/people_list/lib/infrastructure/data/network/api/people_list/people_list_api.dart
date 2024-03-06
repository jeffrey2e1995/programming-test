import 'package:people_list/application/error/error_store.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/data/network/dio/dio_client.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/utils/constants/env.dart';
import 'package:people_list/utils/log/log.dart';

class PeopleListApi {
  final DioClient _dioClient;

  PeopleListApi(this._dioClient);

  // error store: to store error message
  final ErrorStore _errorStore = getIt.get<ErrorStore>();

  // endpoints
  final String getListEndpoint = 'templates/-xdNcNKYtTFG/data';

  Future<List<Person>?> getPeopleList() async {
    try {
      final res = await _dioClient.get(
        '${Envs.apiBaseUrl}/$getListEndpoint',
        queryParameters: {},
      );

      if (res is List) // Assumed as success
      {
        return res.cast<Map<String, dynamic>>().map((e) {
          return Person.fromJson(e);
        }).toList();
      }

      return null;
    } catch (e) {
      Log.debug(e.toString());
      _errorStore.setErrorMessage(e.toString());
    }

    return null;
  }
}
